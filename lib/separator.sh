# lemon-bash-lib | separator | v3
# 分隔线函数
# options:
# $1 (optional,default == '=')
#   option's value == $display_char
#
# $2 (optional,default similar to '1')
#   it's used for control $spearator_width
#   expression: $[$shell_width/$2]
function separator {
    local display_char
    if [[ -z $1 ]] || [[ ! ${#1} -eq 1 ]]; then
        display_char='='
    else
        display_char=$1
    fi

    # 获取终端宽度
    local shell_width=$(stty size | awk '{print $2}')
    # 用输入的信息计算出要打出多长的分割线
    local spearator_width
    if [[ -z $2 ]]; then
        # 如果没有输入则直接用终端宽度
        spearator_width=$shell_width
    else
        spearator_width=$(($shell_width / $2))
    fi
    # 输出
    yes "$display_char" | sed "${spearator_width}q" | tr -d "\n" && echo ""
}
