for %%a IN (*.ogg) DO (ffmpeg -i -loglevel panic -hide_banner "%%a" "%%~na.mp3")
