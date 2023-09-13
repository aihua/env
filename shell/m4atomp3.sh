!/usr/bin/env bash

# Takes a directory as parameter and converts everything inside it
# from M4A to MP3, respecting the bitrate, and creating a directory
# for the converted files.
#
# MIT Licensed by Gwyneth Llewelyn (2022)
#
# Based on https://superuser.com/a/1211902/127382 by @jbowman (2017)

# Loop across the filnames in that directory that end in *.m4a, invoke
# ffprobe to extract the bitrate, then use ffmpeg to convert it into MP3
# and place the result inside the mp3s/${ALBUM}/ directory:
for f in *.m4a
do
        echo "Before ffprobe... testing ${f}"
        bitrate=$(ffprobe -v quiet -of flat=s=_ -show_entries format=bit_rate "${f}" | sed 's/[^0-9]*//g')
        new_filename=$(basename "${f}" .m4a).mp3
        echo "Reading ${f} and writing to ${new_filename} with bitrate ${bitrate}..."
        echo ffmpeg -y -i "${f}" -codec:a libmp3lame -b:a "${bitrate}" -q:a 2 "${new_filename}"
        ffmpeg -y -i "${f}" -codec:a libmp3lame -b:a "${bitrate}" -q:a 2 "${new_filename}"
done
