# separator v2
# 分隔线函数
# options:
# $1 (optional,default == '=')
#   option's value == $_Character
# 
# $2 (optional,default ≈ '1')
#   it's used for control $_Separator_Width
#   expression: $[$_Shell_Width/$2]
llib_separator(){
    if [[ -z $1 ]] || [[ ! ${#1} -eq 1 ]]; then
        _Character='='
    else
        _Character=$1
    fi

    # 获取终端宽度
    _Shell_Width=$(stty size|awk '{print $2}')
    # 用输入的信息计算出要打出多长的分割线
    if [[ -z $2 ]]; then
        # 如果没有输入则直接用终端宽度
        _Separator_Width=$_Shell_Width
    else
        _Separator_Width=$[$_Shell_Width/$2]
    fi
    # 输出
    yes "$_Character" |sed $_Separator_Width'q' |tr -d "\n" && echo 
}
