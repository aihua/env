#!/bin/bash
# 禁止通配符不匹配时保留原字符串
shopt -s nullglob
mkdir -p tab

for dir in [0-9][0-9]/; do
    subdir="${dir%/}"
    echo "处理目录 $subdir"
    # 去除前导零
    x=$((10#$subdir))
    # 正则：表x-1~2位数字+末尾空格
    # pattern="表${x}-[0-9]{1,2} "
    pattern="(表${x}-[0-9]{1,2} |续表)"
    echo "匹配规则：$pattern"

    find "${subdir}/tex" -maxdepth 1 -type f -name "*.tex" \
    -exec grep -lE "$pattern" {} \; | while read -r texpath; do
        base=$(basename "$texpath" .tex)
        png_src="${subdir}/${base}.png"
        [ -f "$png_src" ] && cp -n "$png_src" tab/"${subdir}"-"${base}.png"
    done
done

# 恢复默认
shopt -u nullglob
echo "全部处理完成"
