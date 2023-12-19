#!/bin/bash
# make is not good at handling script,only script can fight script.(just lazy)
# sorry,make先輩
# don't use this script,i was wrong.

echo "this script doesn't work anymore!"
exit 1

_DIR=./lib
_OUTPUT=./target
source $_DIR/merge_function.sh
source $_DIR/remove_script_comment.sh
[[ -d target ]] || mkdir target

build-error_exit(){
    _OUTNAME=errored_exit.sh
    llib-remove_script_comment $_DIR/$_OUTNAME $_OUTPUT/$_OUTNAME
}
build-read_config-bash(){
    _OUTNAME=read_config-bash.sh
    llib_merge_function $_OUTPUT/$_OUTNAME $_OUTPUT/errored_exit.sh
    llib_merge_function $_OUTPUT/$_OUTNAME $_DIR/read_config-bash.sh
}
build-prompts_need_perm(){
    _OUTNAME=read_config-bash.sh
    llib_merge_function $_OUTPUT/$_OUTNAME $_OUTPUT/errored_exit.sh
    llib_merge_function $_OUTPUT/$_OUTNAME $_DIR/prompts_need_perm.sh
}

case $1 in
    error_exit)
        build-error_exit
    ;;
    read_config-bash)
        build-error_exit
        build-read_config-bash
    ;;
    prompts_need_perm)
        build-error_exit
        build-prompts_need_perm
    ;;
    clear)
        rm $_OUTPUT/*
    ;;
esac
