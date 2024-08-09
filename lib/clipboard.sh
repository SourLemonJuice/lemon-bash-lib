# lemon-bash-lib | clipboard | v3
# dependency:
# - wl-clipboard
# - xclip

clipboard_copy() {
    # 检测正在使用的桌面gui程序，并选择对应的剪贴板工具
    case $XDG_SESSION_TYPE in
    wayland)
        # wl-clipboard 是一个wayland下的剪贴板工具集
        wl-copy "$1"
        ;;
    x11)
        # 那这个就是老古董x11的喽
        # 使用 xclip
        echo "$1" | xclip -selection clipboard -in
        # 使用 xsel
        # echo "$Parsed_Code" | xsel -ib
        ;;
    esac
}

clipboard_paste() {
    case $XDG_SESSION_TYPE in
    wayland)
        wl-paste
        ;;
    x11)
        xclip -selection clipboard -out
        ;;
    esac
}
