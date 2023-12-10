# 获取脚本所在的真实路径
llib_script_realpath(){
    # 用dirname截取脚本所在路径的纯路径，而非带有文件名的位置信息
    # 不然就退出
    cd $(dirname $0) || exit 1
    # 然后输出出去
    pwd
}
