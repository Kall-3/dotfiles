#!/usr/bin/env bash
#  ███████╗ ██████╗ ███╗   ███╗██████╗ ██╗██████╗     ██████╗ ██╗ ██████╗███████╗
#  ╚══███╔╝██╔═████╗████╗ ████║██╔══██╗██║╚════██╗    ██╔══██╗██║██╔════╝██╔════╝
#    ███╔╝ ██║██╔██║██╔████╔██║██████╔╝██║ █████╔╝    ██████╔╝██║██║     █████╗  
#   ███╔╝  ████╔╝██║██║╚██╔╝██║██╔══██╗██║ ╚═══██╗    ██╔══██╗██║██║     ██╔══╝  
#  ███████╗╚██████╔╝██║ ╚═╝ ██║██████╔╝██║██████╔╝    ██║  ██║██║╚██████╗███████╗
#  ╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚═════╝ ╚═╝╚═════╝     ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
#  Author  :  z0mbi3
#  Url     :  https://github.com/gh0stzk/dotfiles
#  About   :  This file will configure and launch the rice.
#

# Set bspwm configuration for z0mbi3
set_bspwm_config() {
		bspc config border_width 0
		bspc config top_padding 3
		bspc config bottom_padding 2
		bspc config normal_border_color "#3d414f"
		bspc config active_border_color "#3d414f"
		bspc config focused_border_color "#3d414f"
		bspc config presel_feedback_color "#90ceaa"
		bspc config left_padding 79
		bspc config right_padding 2
		bspc config window_gap 6
}

if pidof -q bspc; then
	pkill -9 bspc > /dev/null
fi

# Reload terminal colors
set_term_config() {
		sed -i "$HOME"/.config/alacritty/fonts.yml \
		-e "s/family: .*/family: JetBrainsMono NF/g" \
		-e "s/size: .*/size: 10/g"
		
		sed -i "$HOME"/.config/alacritty/rice-colors.yml \
		-e "s/colors: .*/colors: *z0mbi3_decay/"
}

# Set compositor configuration
set_picom_config() {
		sed -i "$HOME"/.config/bspwm/picom.conf \
			-e "s/normal = .*/normal =  { fade = true; shadow = true; }/g" \
			-e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
			-e "s/corner-radius = .*/corner-radius = 6/g" \
			-e "s/\".*:class_g = 'Alacritty'\"/\"100:class_g = 'Alacritty'\"/g" \
			-e "s/\".*:class_g = 'FloaTerm'\"/\"100:class_g = 'FloaTerm'\"/g"
}

# Set dunst notification daemon config
set_dunst_config() {
		sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 0/g" \
		-e "s/frame_color = .*/frame_color = \"#0d0f18\"/g" \
		-e "s/separator_color = .*/separator_color = \"#3d414f\"/g" \
		-e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
		-e "s/foreground='.*'/foreground='#c296eb'/g"
		
		sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
		cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
				[urgency_low]
				timeout = 3
				background = "#0d0f18"
				foreground = "#a5b6cf"

				[urgency_normal]
				timeout = 6
				background = "#0d0f18"
				foreground = "#a5b6cf"

				[urgency_critical]
				timeout = 0
				background = "#0d0f18"
				foreground = "#a5b6cf"
_EOF_
}

# Launch the bar and or eww widgets
launch_bars() {
		eww -c ${rice_dir}/bar open bar &
		eww -c ${rice_dir}/dashboard daemon &
		polybar -q tray -c ${rice_dir}/bar/polybar_tray.ini &
}



### ---------- Apply Configurations ---------- ###

set_bspwm_config
set_term_config
set_picom_config
set_dunst_config
launch_bars
