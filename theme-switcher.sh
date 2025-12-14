#!/bin/bash
THEME=$1

case "$THEME" in
    dbz)
        echo "🐉 Activating Super Saiyan Mode..."
        
        # Switch Wayfire
        ln -sf ~/.config/wayfire/wayfire-dbz.ini ~/.config/wayfire/wayfire.ini
        
        # Switch Kitty
        ln -sf ~/.config/kitty/kitty-dbz.conf ~/.config/kitty/kitty.conf
        
        # Restart EWW
        eww kill
        sleep 1
        eww --config ~/.config/eww/dbz daemon
        eww --config ~/.config/eww/dbz open dbz-bar
        
        # Wallpaper
        pkill swaybg
        swaybg -i ~/Pictures/wallpapers/goku-ssj.jpg -m fill &
        
        # Mako
        cat > ~/.config/mako/config << 'EOF'
background-color=#0a0e27
text-color=#FFD700
border-color=#FFD700
border-size=3
EOF
        pkill mako; mako &
        
        echo "⚡ Super Saiyan Mode Activated!"
        ;;
        
    ben10)
        echo "⬢ Omnitrix Transformation Initiated..."
        
        # Switch Wayfire
        ln -sf ~/.config/wayfire/wayfire-ben10.ini ~/.config/wayfire/wayfire.ini
        
        # Switch Kitty
        ln -sf ~/.config/kitty/kitty-ben10.conf ~/.config/kitty/kitty.conf
        
        # Restart EWW
        eww kill
        sleep 1
        eww --config ~/.config/eww/ben10 daemon
        eww --config ~/.config/eww/ben10 open ben10-bar
        
        # Wallpaper
        pkill swaybg
        swaybg -i ~/Pictures/wallpapers/omnitrix.jpg -m fill &
        
        # Mako
        cat > ~/.config/mako/config << 'EOF'
background-color=#0D1B0D
text-color=#00FF00
border-color=#00FF00
border-size=3
EOF
        pkill mako; mako &
        
        echo "⬢ Omnitrix Ready!"
        ;;
        
    *)
        echo "Usage: theme-switcher.sh [dbz|ben10]"
        exit 1
        ;;
esac

notify-send "Theme Switched" "Now using $THEME theme" -t 3000
