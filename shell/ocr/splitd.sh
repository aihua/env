#!/bin/bash
set -euo pipefail
shopt -s nullglob


INPUT_FILE="all_raw.tex"

# 遍历两位数字目录 01 02 ...
for dir in [0-9][0-9]/; do
    d="${dir%/}"
    echo "----------------------------------------"
    echo "处理目录：$d"
    echo "----------------------------------------"

    pushd "$d" >/dev/null

    if [ ! -f $INPUT_FILE ]; then
        echo "目录 $d 无all_raw.tex文件，跳过"
        popd >/dev/null
        echo
        continue
    fi

rm -f [0-9][0-9].tex

    # 使用 awk 按行分析并切分
    awk '
    BEGIN {
        sec = 1;                         # 初始节号
        filename = sprintf("sec-%02d.tex", sec); # 生成第一个文件名 001.tex
        first_sec_found = 0;             # 标记是否找到了第一节
    }
    /^第[一二三四五六七八九十百零〇]+节/ {
        # 当遇到以"第X节"开头的行时
        if (first_sec_found == 0) {
            # 如果是第一次遇到（即第一节），不增加节号，内容依然归入 001.tex
            first_sec_found = 1;
        } else {
            # 如果是后续遇到的节，节号加1，生成新文件名
            sec++;
            filename = sprintf("sec-%02d.tex", sec);
        }
    }
    {
        # 清除文本中残留的 [K 乱码（终端 ESC 控制字符残留）
        # gsub(/\[K/, "");
        
        # 将处理后的行写入对应的文件
        print > filename
    }
    ' "$INPUT_FILE"

    popd >/dev/null
    echo
done

echo "所有目录里的章节切分完成！"
