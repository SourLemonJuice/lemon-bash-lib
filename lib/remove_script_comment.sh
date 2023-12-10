# remove_script_comment
# use:
# 1. input file in $1,script can echo them.
# 2. if have $2 , then output to file($2).
# it's will remove all line starting with '#' incloud shebang(#!/bin/sh)
llib-remove_script_comment(){
    # 如果 $2 不为空
    if [[ ! -z $2 ]];then
        grep --invert-match '^[[:blank:]]*#' $1 > $2
    else
        grep --invert-match '^[[:blank:]]*#' $1
    fi
}
