#!/bin/env bash
# for_array_items v1
set -e

# $1 == ${#Array_Name[@]}
llib_for_array_items()
{
    if [[ -z "$1" ]]; then
        echo "错误: llib_for_array_items 输入的数组个数为空"
        exit 1
    fi
    seq 0 $(( "$1" - 1 ))
}
