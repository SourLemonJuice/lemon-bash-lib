# lemon-bash-lib | separator | v4
# print a separator line
# options:
# $1 (optional,default == '=')
#   option's value == $display_char
#
# $2 (optional,default similar to '1')
#   it's used for control $separator_w
#   expression: $[$shell_w/$2]
# note:
# If the shell width not available, then fix width to 2.
# GitHub Action is an example...
function separator {
    local display_char
    if [[ -z "$1" ]] || [[ ! ${#1} -eq 1 ]]; then
        display_char='='
    else
        display_char="$1"
    fi

    # 获取终端宽度
    local shell_w="$(stty size | awk '{print $2}')"
    if [[ -z "$shell_w" ]]; then
        shell_w=2
    fi

    # 用输入的信息计算出要打出多长的分割线
    local separator_w
    if [[ -z "$2" ]]; then
        # 如果没有输入则直接用终端宽度
        separator_w="$shell_w"
    else
        separator_w="$(($shell_w / "$2"))"
    fi

    # 宽度永远不能为零
    if [[ "$separator_w" -eq 0 ]]; then
        separator_w="$shell_w"
    fi

    # 输出
    yes "$display_char" | sed "${separator_w}q" | tr -d "\n" && echo ""
}
