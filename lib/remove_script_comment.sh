# remove_script_comment
# use: input file in $1,script can print it
# it's will remove all line starting with '#' incloud shebang(#!/bin/sh)
llib-remove_script_comment(){
    grep --invert-match '^[[:blank:]]*#' $1
}
