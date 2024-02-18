# escape_quotation_mark v1

# 将输入的内容中的( ' " / 或 \ )转义成带有转义字符的样子
llib_escape_quotation_mark() {
    # 由 ChatGPT3.5 制作，这东西谁看的懂
    local input="$1"
    local escaped
    # 反斜杠本身就是转译用的，再转译可能会破坏别的东西
    # escaped="${escaped//\\/\\\\}"     # 替换反斜杠
    escaped="${input//\'/\'\\\'\'}"  # 替换单引号
    escaped="${escaped//\"/\\\"}"    # 替换双引号
    escaped="${escaped//\//\\/}"      # 替换斜杠
    echo "$escaped"
}
