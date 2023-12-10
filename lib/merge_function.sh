# 按顺序合并(连接？)脚本函数
# 或者说你最好用在函数上，毕竟脚本谁不写exit嘛
# 我想把这个脚本拿来和make一起用的
llib_merge_function(){
    # 检测要合并的文件是否存在
    [[ -f $2 ]] || exit 1

    # 两个文件中间的提示信息
    echo '' >> $1
    echo "# ----merge function $2 to $1 ----" >> $1
    echo '' >> $1
    # 把 $2 写到 $1 尾巴上，并且删除所有注释
    grep --invert-match '^[[:blank:]]*#' $2 >> $1
}
