#!/usr/bin/env python3
"""Safely patch only the resolution of known Crimson Skies 2000 EXE builds.

Accepts either the exact original unSafeDisc 1.5.5 TESTME.EXE or a verified
already-widescreen Crimson Skies executable. Never reads or touches DLLs.

Copyright (C) 2026 legluondunet.
SPDX-License-Identifier: GPL-3.0-or-later
"""

import argparse
import hashlib
import os
from pathlib import Path
import stat
import struct
import sys
import tempfile

EXE_SIZE = 2_580_480
# Known good unSafeDisc output uploaded and verified by the user.
TESTME_SHA256 = "43540fc97347210d6f4c10b77edbd4cdab1f03d57554d638223c2430a6c37d75"
# Original known widescreen patch reference, 1920x1080.
REFERENCE_SHA256 = "5578a15ce072d09655be43419829a7530ed6c71fa5a8778fd9d4661770b39d67"
WIDTH_OFFSET = 0x20254B
HEIGHT_OFFSET = 0x20254F
FOV60_OFFSET = 0x20409C
FOV80_OFFSET = 0x2040A0
REFERENCE_FOV60 = bytes.fromhex("92 0a 86 3f")
REFERENCE_FOV80 = bytes.fromhex("c2 b8 b2 3f")
BACKUP_SUFFIX = ".crimson-original.bak"

# EXE-only code modifications required to turn *this precise* unSafeDisc
# TESTME.EXE into the previously verified widescreen-capable build.
# Small patch hunks, not a copy of the game executable. All patch destinations
# are guarded by the exact TESTME_SHA256 and the final REFERENCE_SHA256.
# Only the width and height words are subsequently changed by this script.
TESTME_TO_WIDESCREEN_PATCH = (
    (0x02B678, "e95c6e1d0090"),
    (0x02B67F, "e9846e1d0090"),
    (0x041100, "83f8030f84b8"),
    (0x041107, "0000e90601"),
    (0x04110D, "0090"),
    (0x041229, "ff354f256000ff354b256000e8e6fbffff"),
    (0x04123C, "6a00e88dfeffffff354f256000ff354b256000e85cfeffff6a006a00e813fdffffff354f2560"),
    (0x041263, "ff354b256000e9ed0000"),
    (0x055C01, "f0efa1"),
    (0x055C0E, "f4efa1"),
    (0x19EA39, "e9a400"),
    (0x19EA3E, "90"),
    (0x1A190E, "00"),
    (0x1A8EB1, "83f8040f84c50000008b0d4b256000e9e70000009090909090909090909090909090909090909090909090909090909090909090909090909090909090909090"),
    (0x1A8FC9, "8b0d4f256000eb6c90909090"),
    (0x1A9053, "909090"),
    (0x1AA08B, "e92d840500"),
    (0x1C159F, "00"),
    (0x2024BD, "db054f2560"),
    (0x2024C3, "da354b2560"),
    (0x2024C9, "d91df8b371"),
    (0x2024CF, "8d54241852e9b77bfaffd905a04060"),
    (0x2024DF, "d80de03260"),
    (0x2024E5, "d9f2ddd8db054b2560"),
    (0x2024EF, "da354f2560"),
    (0x2024F5, "d835d07b60"),
    (0x2024FB, "dec9d9e8d9f3d835e03260"),
    (0x202507, "c3d9059c4060"),
    (0x20250E, "d80de03260"),
    (0x202514, "d9f2ddd8db054b2560"),
    (0x20251E, "da354f2560"),
    (0x202524, "d835d07b60"),
    (0x20252A, "dec9d9e8d9f3d835e03260"),
    (0x202536, "d915f0efa1"),
    (0x20253C, "d9c0d80de03260"),
    (0x202544, "dd1df4efa1"),
    (0x20254A, "c38007"),
    (0x20254F, "3804"),
)


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def read_regular_file(path: Path) -> bytes:
    # Explicitly reject symlinks, including those pointing to an EXE.
    mode = path.lstat().st_mode
    if not stat.S_ISREG(mode):
        raise ValueError(f"Not a regular file: {path}")
    return path.read_bytes()


def validate_pe32(data: bytes) -> None:
    if len(data) != EXE_SIZE or data[:2] != b"MZ":
        raise ValueError("Unsupported executable (wrong size or DOS signature)")
    pe_offset = struct.unpack_from("<I", data, 0x3C)[0]
    if pe_offset > len(data) - 0x18 or data[pe_offset:pe_offset + 4] != b"PE\0\0":
        raise ValueError("Invalid PE signature")
    if struct.unpack_from("<H", data, pe_offset + 4)[0] != 0x14C:
        raise ValueError("Expected a 32-bit x86 executable")


def classify(data: bytes) -> tuple[str, tuple[int, int] | None]:
    """Only accept two exact builds and their resolution/FOV variants."""
    validate_pe32(data)
    if sha256(data) == TESTME_SHA256:
        return "unSafeDisc TESTME.EXE (original, no widescreen patch)", None
    normalized = bytearray(data)
    struct.pack_into("<II", normalized, WIDTH_OFFSET, 1920, 1080)
    normalized[FOV60_OFFSET:FOV60_OFFSET + 4] = REFERENCE_FOV60
    normalized[FOV80_OFFSET:FOV80_OFFSET + 4] = REFERENCE_FOV80
    if sha256(normalized) == REFERENCE_SHA256:
        return "widescreen-patched EXE", struct.unpack_from("<II", data, WIDTH_OFFSET)
    raise ValueError("Unsupported EXE build/hash; no file modified")


def add_widescreen_code(original: bytes) -> bytes:
    if sha256(original) != TESTME_SHA256:
        raise ValueError("Code patch requires the exact known TESTME.EXE")
    modified = bytearray(original)
    for offset, hexbytes in TESTME_TO_WIDESCREEN_PATCH:
        payload = bytes.fromhex(hexbytes)
        modified[offset:offset + len(payload)] = payload
    if sha256(modified) != REFERENCE_SHA256:
        raise ValueError("Internal patch integrity check failed; no file modified")
    return bytes(modified)


def apply_resolution(data: bytes, width: int, height: int) -> bytes:
    kind, _ = classify(data)
    if not (320 <= width <= 16384 and 240 <= height <= 16384):
        raise ValueError("Resolution outside the supported range")
    if not 0.5 <= width / height <= 4.0:
        raise ValueError("Unsupported aspect ratio")
    if kind.startswith("unSafeDisc"):
        data = add_widescreen_code(data)
    result = bytearray(data)
    struct.pack_into("<II", result, WIDTH_OFFSET, width, height)
    if not classify(result)[0].startswith("widescreen"):
        raise ValueError("Patched EXE failed final integrity check")
    return bytes(result)


def read_backup(path: Path) -> bytes | None:
    try:
        return read_regular_file(path)
    except FileNotFoundError:
        return None


def create_backup_once(path: Path, backup: Path, original: bytes) -> None:
    if read_backup(backup) is not None:
        return  # A previous backup was already validated by caller.
    with backup.open("xb") as f:  # Never overwrite an existing backup/symlink.
        f.write(original)
        f.flush()
        os.fsync(f.fileno())
    try:
        os.chmod(backup, stat.S_IMODE(path.stat().st_mode))
        if read_regular_file(backup) != original:
            raise OSError("Backup verification failed")
    except Exception:
        backup.unlink(missing_ok=True)
        raise
    print(f"Original backup created: {backup}")


def replace_atomically(path: Path, data: bytes) -> None:
    mode = stat.S_IMODE(path.lstat().st_mode)
    fd, tempname = tempfile.mkstemp(prefix=f".{path.name}-", suffix=".tmp", dir=path.parent)
    try:
        with os.fdopen(fd, "wb") as f:
            f.write(data)
            f.flush()
            os.fsync(f.fileno())
        os.chmod(tempname, mode)
        read_regular_file(path)  # Refuse symlink substitution.
        os.replace(tempname, path)
        if read_regular_file(path) != data:
            raise OSError("Post-write verification failed")
    finally:
        if os.path.exists(tempname):
            os.unlink(tempname)


def main() -> None:
    parser = argparse.ArgumentParser(description="Patch Crimson Skies resolution (EXE only)")
    parser.add_argument("--exe", type=Path, default=Path(__file__).resolve().parent / "CRIMSON.EXE",
                        help="EXE to patch, including testme.exe (default: CRIMSON.EXE beside script)")
    parser.add_argument("--width", type=int, default=1920)
    parser.add_argument("--height", type=int, default=1080)
    group = parser.add_mutually_exclusive_group()
    group.add_argument("--status", action="store_true", help="Inspect without changing the executable")
    group.add_argument("--restore", action="store_true", help="Restore the saved original")
    args = parser.parse_args()
    exe = args.exe.expanduser().absolute()
    current = read_regular_file(exe)
    kind, current_resolution = classify(current)
    backup = exe.with_name(exe.name + BACKUP_SUFFIX)
    saved = read_backup(backup)
    if saved is not None:
        classify(saved)  # Never trust arbitrary existing backups.
    print(f"Executable: {exe}")
    print(f"Detected build: {kind}")
    if current_resolution is None:
        print("Forced widescreen resolution: not installed (game native setting)")
    else:
        print(f"Current widescreen resolution: {current_resolution[0]} x {current_resolution[1]}")
    print(f"Backup: {backup} ({'present' if saved is not None else 'absent'})")
    if args.status:
        return
    if args.restore:
        if saved is None:
            if current_resolution is None:
                print("Already original TESTME.EXE; no backup required.")
                return
            raise ValueError("Cannot restore: original EXE backup missing")
        if current != saved:
            replace_atomically(exe, saved)
            print("EXE restored from original backup.")
        else:
            print("EXE already matches backup.")
        return
    updated = apply_resolution(current, args.width, args.height)
    if updated == current:
        print("Resolution already correct; no changes made.")
        return
    if saved is not None and current_resolution is None and saved != current:
        raise ValueError("Existing backup does not match pristine TESTME.EXE; refusing to replace EXE")
    create_backup_once(exe, backup, current)
    replace_atomically(exe, updated)
    print(f"Widescreen resolution set to {args.width} x {args.height}.")
    print("Only the EXE was modified. No DLL read or changed.")


if __name__ == "__main__":
    try:
        main()
    except (OSError, ValueError, struct.error) as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        sys.exit(1)
