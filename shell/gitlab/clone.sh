#!/bin/bash
# 利用Gitlab API，递归clone某Group下的项目，项目信息输出到README.md文件中。
# 需要先在Gitlab中创建访问接口所需的TOKEN。

TOKEN=""
GROUP_ID=""
PAGE="1"
API_URL="http://gitlab.example.com/api/v4/groups/$GROUP_ID/projects?per_page=100&page=$PAGE"

# Fetch repositories name, path, description
RESPONSE=$(curl --silent --header "Private-Token: $TOKEN" "$API_URL")

# 检查curl命令是否成功执行
if [ $? -ne 0 ]; then
    echo "Error: Failed to fetch data from $API_URL"
    exit 1
fi

# `-r` 参数使 `jq` 输出原始字符串，而不是带引号的 JSON 字符串。
# `.[]` 遍历 JSON 数组中的每个对象。
# `{name, description}` 提取每个对象的 `name` 和 `description` 等字段
# `| \(.name) | \(.description) |` 格式化输出为 `| name | description |` 的形式。

PROJECTS=$(echo "$RESPONSE" | jq -r '.[] | {path, name, description, ssh_url_to_repo} | "| \(.path) | \(.name) | \(.description) | \(.ssh_url_to_repo) |"')

# 检查jq命令是否成功执行
if [ $? -ne 0 ]; then
    echo "Error: Failed to parse JSON data"
    exit 1
fi

# 打印结果
echo "$PROJECTS" >> README.md

# Fetch repositories list
REPOS=$(echo "$RESPONSE" | jq -r '.[].ssh_url_to_repo')

# Clone each repository
for REPO in $REPOS; do
    git clone $REPO
done
