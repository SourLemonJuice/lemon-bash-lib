# 分隔线函数
# 参数:
# $1 == _Character(default == '=')
llib_separator(){
    if [[ -z $1 ]] || [[ ! ${#1} -eq 1 ]]; then
        _Character='='
    else
        _Character=$1
    fi

    ShellWidth=$(stty size|awk '{print $2}')
    yes "$_Character" |sed $ShellWidth'q' |tr -d "\n" && echo 
}
