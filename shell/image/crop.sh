#!/bin/bash

mkdir -p new

# 遍历当前目录所有 png 文件
for img in *.png; do
  # crop=宽:高:起始X:起始Y
  # ffmpeg -i "$img" -vf "crop=1520:2150:768:0" -y new/"$img"
  # ffmpeg -i "$img" -vf "crop=2120:3000:355:240" -y new/"$img"
  ffmpeg -i "$img" -vf "crop=2120:3000:0:240" -y new/"$img"

  # 去水印
  ffmpeg -i "$f" \
    -vf "drawbox=x=0:y=50:w=2150:h=105:c=white:t=fill" \
    -update 1 -frames:v 1 -y new/"$f"
done

