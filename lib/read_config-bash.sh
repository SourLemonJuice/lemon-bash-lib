# llib_read_config-bash
# 读取配置文件
# 依赖于 errored_exit
# 输入参数:
# $1 == Config_Dir_Path1
# $2 == Config_Dir_Path2
# e.g: $Config_Dir_Path1/__$Config_Dir_Path2__ == /script/path/__config.d__
llib_read_config-bash(){
    Config_Dir_Path1=$1
    Config_Dir_Path2=$2

    # 检测用户配置目录下是否有文件，如果有就循环读取（这个检测方式真垃圾）
    if [[ -d $Config_Dir_Path1/$Config_Dir_Path2 && ! -z $(ls $Config_Dir_Path1/$Config_Dir_Path2) ]]; then
        # 循环读取目录下的配置文件
        for i in $Config_Dir_Path1/$Config_Dir_Path2/*;do
            source $i
            # 如果没能加载就退出
            llib_error_exit
        done
    fi
}
