#!/bin/bash

lang=$1
width=$2
height=$3

echo $lang $width $height

if [ -d "drive_c/Unreal Gold" ]; then
mkdir "drive_c/GOG Games"
mv "drive_c/Unreal Gold" "drive_c/GOG Games"
cd "drive_c/GOG Games/Unreal Gold"
fi

cd System

cp Default.ini Default.ini.ori
sed -i 's/GameRenderDevice=.*/GameRenderDevice=OpenGLDrv.OpenGLRenderDevice/' Default.ini
#sed -i 's/GameRenderDevice=.*/GameRenderDevice=D3D9Drv.D3D9RenderDevice/' Default.ini
sed -i 's/AudioDevice=.*/AudioDevice=ALAudio.ALAudioSubsystem/' Default.ini
sed -i 's/Language=.*/Language='$lang'/' Default.ini
sed -i 's/FirstRun=.*/FirstRun=227/' Default.ini
sed -i 's/FullscreenViewportX=.*/FullscreenViewportX='$width'/' Default.ini
sed -i 's/FullscreenViewportY=.*/FullscreenViewportY='$height'/' Default.ini
AudioDevice=ALAudio.ALAudioSubsystem


cp Unreal.ini Unreal.ini.ori
sed -i 's/GameRenderDevice=.*/GameRenderDevice=OpenGLDrv.OpenGLRenderDevice/' Unreal.ini
#sed -i 's/GameRenderDevice=.*/GameRenderDevice=D3D9Drv.D3D9RenderDevice/' Unreal.ini
sed -i 's/AudioDevice=.*/AudioDevice=ALAudio.ALAudioSubsystem/' Unreal.ini
sed -i 's/Language=.*/Language='$lang'/' Unreal.ini
sed -i 's/FirstRun=.*/FirstRun=227/' Unreal.ini
sed -i 's/FullscreenViewportX=.*/FullscreenViewportX='$width'/' Unreal.ini
sed -i 's/FullscreenViewportY=.*/FullscreenViewportY='$height'/' Unreal.ini


cp DefaultLinux.ini DefaultLinux.ini.ori
sed -i 's/Language=.*/Language='$lang'/' DefaultLinux.ini
sed -i 's/FullscreenViewportX=.*/FullscreenViewportX='$width'/' DefaultLinux.ini
sed -i 's/FullscreenViewportY=.*/FullscreenViewportY='$height'/' DefaultLinux.ini

cp UnrealLinux.ini UnrealLinux.ini.ori
sed -i 's/Language=.*/Language='$lang'/' UnrealLinux.ini
sed -i 's/FullscreenViewportX=.*/FullscreenViewportX='$width'/' UnrealLinux.ini
sed -i 's/FullscreenViewportY=.*/FullscreenViewportY='$height'/' UnrealLinux.ini

cd ..

rm -f -r app tmp GameuxInstallHelper.dll gfw_high.ico gog.ico gog_unreal_gold.sdb Support.ico

