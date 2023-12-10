#!/bin/bash
# make is not good at handling script,only script can fight script.(just lazy)
# sorry,make先輩
_DIR=./lib
_OUTPUT=./target
source $_DIR/merge_function.sh
[[ -d target ]] || mkdir target

build-read_config-bash(){
    _OUTNAME=read_config-bash.sh
    llib_merge_function $_OUTPUT/$_OUTNAME $_DIR/errored_exit.sh
    llib_merge_function $_OUTPUT/$_OUTNAME $_DIR/read_config-bash.sh
}
build-prompts_need_perm(){
    _OUTNAME=read_config-bash.sh
    llib_merge_function $_OUTPUT/$_OUTNAME $_DIR/errored_exit.sh
    llib_merge_function $_OUTPUT/$_OUTNAME $_DIR/prompts_need_perm.sh
}

case $1 in
    all)
        build-read_config-bash
        build-prompts_need_perm
    ;;
    read_config-bash)
        build-read_config-bash
    ;;
    clear)
        rm $_OUTPUT/*
    ;;
esac
