for %%a IN (*.ogg) DO (ffmpeg -i "%%a" "%%~na.mp3")
