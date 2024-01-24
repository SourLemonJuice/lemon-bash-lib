# clipboard v1
# dependency:
# - wl-clipboard
# - xclip

llib_clipboard_copy() {
    # 检测正在使用的桌面gui程序，并选择对应的剪贴板工具
    case $XDG_SESSION_TYPE in
    wayland)
        # wl-clipboard 是一个wayland下的剪贴板工具集
        wl-copy "$1"
        ;;
    x11)
        # 那这个就是老古董x11的喽
        # xclip 的实现
        echo "$1" | xclip -selection c
        # xsel 的实现
        # echo "$Parsed_Code" | xsel -ib
        ;;
    esac
}

llib_clipboard_paste() {
    case $XDG_SESSION_TYPE in
    wayland)
        wl-paste "$1"
        ;;
    x11)
        echo "只找了wayland模式的工具嘞"
        ;;
    esac
}
