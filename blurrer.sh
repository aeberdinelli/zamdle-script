#!/bin/bash

# Files
INPUT=samples/example.mp4
OUTPUT=output/pepe.mp4

# Blur size
#CROP_WIDTH=200 # Blur killer only
CROP_WIDTH=400 # Blur killer & victim

CROP_HEIGHT=200

# Blur position
LEFT=1500
TOP=30

ffmpeg -i $INPUT -filter_complex "[0:v]crop=$CROP_WIDTH:$CROP_HEIGHT:$LEFT:$TOP,avgblur=20[fg];[0:v][fg]overlay=$LEFT:$TOP[v]" -map "[v]" -map 0:a -c:v libx264 -c:a copy -movflags +faststart $OUTPUT
