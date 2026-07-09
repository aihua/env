#!/bin/bash
set -euo pipefail
shopt -s nullglob

# 遍历两位数字目录 01 02 ...
for dir in [0-9][0-9]/; do
    d="${dir%/}"
    echo "----------------------------------------"
    echo "处理目录：$d"
    echo "----------------------------------------"

    pushd "$d" >/dev/null

    png_list=(*.png)
    if [[ ${#png_list[@]} -eq 0 ]]; then
        echo "目录 $d 无png文件，跳过"
        popd >/dev/null
        echo
        continue
    fi

    for f in *.png; do
      # 为OCR等比例缩放长边至1280px，同时增加白底，并调整为灰度图像
      ffmpeg -i "$f" \
            -vf "format=rgba,drawbox=x=0:y=0:w=iw:h=ih:color=white@1:replace=1,scale=-1:'min(1280,ih)':flags=lanczos,format=gray,normalize,eq=contrast=1.3" \
            -pix_fmt gray8 \
            -update 1 -frames:v 1 -y "tmp_$f"
      mv "tmp_$f" "$f"
    done

    popd >/dev/null
    echo
done

echo "所有目录图片缩放完成！"
