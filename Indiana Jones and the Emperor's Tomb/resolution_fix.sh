#!/bin/bash

cd "drive_c/GOG Games/Indiana Jones and the Emperor's Tomb/GameData/indy"
{
	echo 'fpsLimit=30'
	echo 'notext=1'
	echo 'pack=0'
	echo 'title=0'
	echo 'res_width=1280'
	echo 'res_height=960'
	echo 'res_bpp=32'
	echo 'subtitles=true'
} > vars.cfg
