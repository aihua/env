#!/bin/bash
set -euo pipefail
shopt -s nullglob

mkdir -p tex


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

    mkdir -p tex

    for img in *.png; do
        ollama run glm-ocr:bf16 Text Recognition: ./$img > tex/${img%.png}.tex
        cat tex/${img%.png}.tex >> all_raw.tex
    done

    cp all_raw.tex ../tex/chapter-$d.tex

    popd >/dev/null
    echo
done

echo "所有目录图片OCR完成！"
