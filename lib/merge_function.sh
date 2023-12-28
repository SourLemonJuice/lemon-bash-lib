# merge_function v2
# 可选(RemoveComment 需要)依赖于 remove_script_comment
# 按顺序合并(连接？)脚本函数
# 或者说你最好用在函数上，毕竟脚本谁不写exit嘛
# 
# 使用方式
# $1 模式:
# - FromTo: 将 $2 写入 $3
# - FromTo-Detail: 将 $2 写入 $3 ，写入时还会带上合并的源文件与目标路径
# - RemoveComment: 将删除了注释的 $2 写入 $3
# 
# 例: llib_merge_function RemoveComment ./test/source.sh ./test/target.sh
llib_merge_function(){
    # 检测要合并的文件是否存在
    # 这里不需要检测目标文件是否存在，没有的话 ">>" 会自己创建的
    # $1 这种系统变量不能是数组，别犯傻
    [[ -f $2 ]] || exit 1

    # 重命名模式，源和目标作为默认
    _Mode=$1
    _Source=$2
    _Target=$3
    # 模式选择
    case $1 in
    FromTo)
        # 普通模式
        # 把 $_Source 写到 $_Target 尾巴上
        cat $_Source >> $_Target
    ;;
    FromTo-Detail)
        # 插入详细信息模式
        # 写入两个文件中间的提示信息
        echo '' >> $_Target
        echo "# <---- merge function $_Source to $_Target ---->" >> $_Target
        echo '' >> $_Target
        # 把 $_Source 写到 $_Target 尾巴上
        cat $_Source >> $_Target
    ;;
    RemoveComment)
        llib-remove_script_comment $_Source >> $_Target
    ;;
    esac
}
