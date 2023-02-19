@echo off
color 0d
title "installing Virtua FIghter PC soundtracks..."
SETLOCAL ENABLEDELAYEDEXPANSION
c:
cd c:\tmp
for %%A in (d e f g h i j k l m n o p q r s t u v w x y z) do (
dir %%A:|bin\grep -c "SEGA">%%A.txt
set driv=
set /p driv=<%%A.txt
echo lettre %%A fichier %%A.txt resultat %driv% !driv!
if !driv!==1 	(echo drive est égal à 1
		set drivresult=%%A:
		goto :rip 
		)
)

goto :notfound


:rip
for %%x in (2,3,4,5,6,7,8,9) do (
mplayer\mplayer -cdrom-device %drivresult% -ao pcm:file=track0%%x.wav cdda://%%x )
for %%y in (10,11,12,13,14,15,16,17,18,19,20,21) do (
mplayer\mplayer -cdrom-device %drivresult% -ao pcm:file=track%%y.wav cdda://%%y )
for %%a IN (*.wav) DO (
	echo %%a & bin\sox "%%a" "%%~na.flac")
mkdir "c:\SEGA\VFPC\music"
xcopy /Y *.flac "c:\SEGA\VFPC\music"
goto :fin

:notfound
echo le CD SEGA VIRTUA FIGHTER est introuvable
goto :fin

:fin
