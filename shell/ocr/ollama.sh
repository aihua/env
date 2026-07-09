#!/bin/bash
set -euo pipefail

IMG_DIR="."
OUT_TEX_FOLDER="./tex"
RAW_MERGE_FILE="all_raw.tex"
OCR_MODEL='glm-ocr:bf16'

check_dep() {
    if ! command -v ollama &>/dev/null
    then
        echo '缺少ollama程序'
        exit 1
    fi
}
check_dep

mkdir -p "$OUT_TEX_FOLDER"
> "$RAW_MERGE_FILE"

for img_path in ./*.png
do
    [ -f "$img_path" ] || continue
    img_name=$(basename "$img_path")
    base_name="${img_name%.png}"
    target_tex="${OUT_TEX_FOLDER}/${base_name}.tex"
    echo "正在处理 $img_name"

    # 全部使用单引号，无换行、无嵌套
    prompt_base='Text Recognition: 去除页眉页脚页码水印，表格输出table+tabular，禁止```，插图仅图号标题，段落空一行，禁止重复文字，无错别字英文 '
    full_prompt="${prompt_base}${img_path}]"
    OCR_RAW=$(ollama run "$OCR_MODEL" "$full_prompt")

    # 纯echo写入，不使用<<EOF
    echo "%============${img_name}=============" > "$target_tex"
    echo "$OCR_RAW" >> "$target_tex"
    echo '' >> "$target_tex"

    cat "$target_tex" >> "$RAW_MERGE_FILE"
done

echo 'OCR任务全部完成，输出目录 ./tex'
