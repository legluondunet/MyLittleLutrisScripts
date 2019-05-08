@echo off
color 0E
echo.
echo.
echo ---------------------------------------------------------
echo 		convert audio format, please wait...
echo ---------------------------------------------------------
echo.
echo.
echo.
for %%a IN (*.ogg) DO (
	echo %%a & ffmpeg -v warning -hide_banner -stats -i "%%a" "%%~na.mp3"
)
