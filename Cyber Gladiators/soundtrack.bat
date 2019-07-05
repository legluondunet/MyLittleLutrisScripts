@echo off
color 0d
title "installing Cyber Gladiators soundtracks..."
c:
cd c:\tmp
for %%A in (d e f g h i) do (
dir %%A:|bin\grep -c "CYBER">%%A.txt)

set driv=
set /p drivd=<d.txt
echo %drivd%
if %drivd%==1 (
set driv=d:
goto :rip )
set /p drive=<e.txt
echo %drive%
if %drive%==1 (
set driv=e:
goto :rip )
set /p drivf=<f.txt
echo %drivf%
if %drivf%==1 (
set driv=f:
goto :rip )
set /p drivg=<g.txt
echo %drivg%
if %drivg%==1 (
set driv=g:
goto :rip )
goto :notfound

:notfound
echo le CD Cyber Gladiators est introuvable
goto :eof

:rip
for %%x in (2,3,4,5,6,7,8,9) do (
mplayer\mplayer -cdrom-device %driv% -ao pcm:file=track0%%x.wav cdda://%%x )
for %%y in (10,11,12,13,14,15) do (
mplayer\mplayer -cdrom-device %driv% -ao pcm:file=track%%y.wav cdda://%%y )
for %%a IN (*.wav) DO (
	echo %%a & bin\sox "%%a" "%%~na.flac")
mkdir "c:\SIERRA\CYBER\music"
xcopy /Y *.flac "c:\SIERRA\CYBER\music"
