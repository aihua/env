#!/bin/bash

# cut video from $start to the last $end seconds.

start="8"
end="0"

for video in *.mp4
do
  duration=`ffprobe -v error -show_entries format=duration -of csv=p=0 "${video}"`
  duration=`bc -e ${duration}-${end}`
  ffmpeg -ss ${start} -to ${duration} -i "${video}" -c copy "../new/${video}"
  # Mosaic, color:#F1F3F4, alpha:0.5
  ffmpeg -ss ${start} -i input.mp4 -vf "drawbox=x=175:y=48:w=960:h=30:color=0xF1F3F4@0.5:t=fill" output.mp4
  touch -r "${video}" "../new/${video}"
done
