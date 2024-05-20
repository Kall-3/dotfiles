hide () {
    eww -c "$HOME"/.config/bspwm/rices/z0mbi3/bar close bar
}

unhide () {
    eww -c "$HOME"/.config/bspwm/rices/z0mbi3/bar open bar
}

case $1 in
    -u)
        unhide
        ;;
    -h)
        hide
        ;;
esac
