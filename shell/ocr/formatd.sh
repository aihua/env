#!/bin/bash
set -euo pipefail
shopt -s nullglob

RAW_MERGE_FILE="all_raw.tex"
RULE_FILE="./rule.md"
SAMPLE_FILE="./sample.tex"
API_URL="http://127.0.0.1:11434/api/generate"
FORMAT_MODEL="gemma4:26b-mlx"
FORMAT_CTX=32768
FORMAT_MAX_OUT=16384
DIST="/tmp/tex"


RULE_CONTENT=$(cat "$RULE_FILE")
SAMPLE_CONTENT=$(cat "$SAMPLE_FILE")

# 遍历两位数字目录 01 02 ...
for dir in [0-9][0-9]/; do
    d="${dir%/}"
    echo "----------------------------------------"
    echo "处理目录：$d"
    echo "----------------------------------------"

    pushd "$d" >/dev/null

    if [ ! -f $RAW_MERGE_FILE ]; then
        echo "目录 $d 无all_raw.tex文件，跳过"
        popd >/dev/null
        echo
        continue
    fi

    for section_file in sec-*.tex
    do
      echo "处理章节：$section_file"
      # 读取内容
      ALL_RAW_TEXT=$(cat "$section_file")

      # 外层shell拼接完整提示词
      FULL_PROMPT="
      # 强制转换任务，严格遵循下方全部规则
      ## 转换规范
      $RULE_CONTENT
      ## LaTeX标准输出样例（表格、分录、标题层级完全复刻）
      $SAMPLE_CONTENT

      ### 待转换原始全文
      $ALL_RAW_TEXT

      ### 硬性输出约束
      1. 所有章节标题、一二级标题、列表、表格全部按规则转为标准LaTeX标签；
      2. 删除页眉、页码、水印等无关文字；
      3. 表格使用指定模板，禁止三线表，数字英文千分逗号；
      4. 禁止直接粘贴原始纯文本，必须全部重构为合规LaTeX；
      5. 仅输出最终完整LaTeX代码，不要解释、不要规则原文、不要markdown代码块；
      6. 完整保留全部有效文字、数字、公式、表格结构，不得删减内容。
      "

      OUT_TEX="chapter-$d.tex"

      # 请求Gemma格式化
      CLEAN_FULL=$(jq -n \
          --arg model "$FORMAT_MODEL" \
          --arg prompt "$FULL_PROMPT" \
          '{
              "model": $model,
              "prompt": $prompt,
              "stream": false,
              "options": {
                  "temperature": 0.0,
                  "top_p": 0.1,
                  "repeat_penalty": 1.2,
                  "num_ctx": '"$FORMAT_CTX"',
                  "num_predict": '"$FORMAT_MAX_OUT"'
              }
          }' | curl -s -X POST "$API_URL" -H "Content-Type:application/json" -d @- | jq -r '.response')

      # 清洗多余标记
      FINAL_TEX=$(echo "$CLEAN_FULL" | sed -E 's/```(latex)?//g' | sed '/^[[:space:]]*$/d')

      # 写入最终成品
      echo "$FINAL_TEX" >> $DIST/"$OUT_TEX"
    done

    popd >/dev/null
    echo
done

echo "所有目录文件格式化完成！"
