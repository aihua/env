#!/bin/bash

# Using concat 'protocol' to files:
concat=""

for file in *.mp4
do
  ffmpeg -i $file -an -c:v copy $file.ts
  concat=$concat"|$file.ts"
done

ffmpeg -i  "concat:${concat#|}" -an -c:v copy tmp.mp4

# Using 'demuxer' to concat files with same codecs: 
# printf "file '%s'\n" 25032117*.mp4 > list.txt
# ffmpeg -f concat -safe 0 -i list.txt -c copy tmp.mp4

# 裁剪画面，添加黑边填充,使画面达到1920x1080
# ffmpeg -i demo.mp4 -i m.mp3  -vf crop=1920:720:0:0,pad=1920:1080:0:181 2503211710.mp4

# 调色温
# ffmpeg -i tmp.mp4 -filter_complex "colortemperature=10000" tmp-temperated.mp4

# 添加字幕
# Alignment：字幕在底端时，1=左对齐, 2=居中, 3=右对齐；字幕在顶端时，各数字加3；字幕在中央时，各数字加6。
# Outline: 文字的轮廓描边，0为无轮廓描边。
# MarginV: 字幕出现的垂直距离。
# PrimaryColour: 格式&HAABBGGRR。其中，透明度(Alpha)以AA表示，00表示不透光/可见，FF表示全透明/不可见。在HTML的颜色'#2596be'对应的为'&Hbe9625'，前导零可省略，即'&H00e9625'。
# Netflix风格：BackColour=&H80000000,Spacing=0.2,Outline=0,Shadow=0.75。
# B站风格：PrimaryColour=&H00FFFFFF,BackColour=&H80B0279C,Outline=0即"background_color": "#9C27B0","background_alpha": 0.5,"font_color": "#FFFFFF"。
# ffmpeg -i tmp.mp4 -vf "subtitles=demo.srt:force_style='Fontname=PingFang SC Light,Fontsize=10,PrimaryColour=&H0000FFFF,Outline=0,Alignment=6,MarginV=20'" output.mp4

# B站视频：客户端离线缓存，查找.m4s文件，大的为视频，小的为音频
# 删除m4s文件前九个字节（文件开始前9个0）后进行合成
# dd if=v.m4s bs=512k | { dd bs=9 count=1 of=/dev/null; dd bs=512k of=v.dump; }
# dd if=a.m4s bs=512k | { dd bs=9 count=1 of=/dev/null; dd bs=512k of=a.dump; }
# ffmpeg -i v.dump -i a.dump -c copy output.mp4



# 循环背景音乐
ffmpeg -stream_loop -1 -i demo.mp3 -i tmp.mp4 -c:v copy -c:a aac -shortest -async 1 output.mp4

