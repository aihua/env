#!/bin/bash

# cut video from $start to the last $end seconds.

start="18"
end="8"

for video in *.mp4
do
  duration=`ffprobe -v error -show_entries format=duration -of csv=p=0 ${video}`
  duration=`bc -e ${duration}-${end}`
  ffmpeg -ss ${start} -to ${duration} -i ${video} -c copy ../new/${video}
done
