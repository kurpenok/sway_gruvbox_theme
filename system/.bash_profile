#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then

	# For Artix Linux

	# eval `dbus-launch --sh-syntax --exit-with-session`
	# pipewire &
	# pipewire-pulse &
	# wireplumber &

	exec sway
fi

export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland
