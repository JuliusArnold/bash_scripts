#!/usr/bin/env bash
#
#     __   ______    	+-------------------------------------------------+
#    /\ \ /\  __ \   	| Author:   Julius Arnold                         |
#   _\_\ \\ \  __ \	| E-Mail:   julius.arnold@hotmail.com             |
#  /\_____\\ \_\ \_\ 	| GitHub:   https://github.com/JuliusArnold       |
#  \/_____/ \/_/\/_/	+-------------------------------------------------+
#

Echo()      { echo -en "\x1b\e[48;5;16m\e[38;5;250;82m$1\x1b[K\x1b[0m";}
EchoGr()    { echo -en "\x1b\e[48;5;16m\e[38;5;244;82m$1\x1b[K\x1b[0m";}
EchoRd()    { echo -en "\x1b\e[48;5;16m\e[38;5;9;82m$1\x1b[K\x1b[0m";  }
EchoGn()    { echo -en "\x1b\e[48;5;16m\e[38;5;46;82m$1\x1b[K\x1b[0m"; }
EchoMa()    { echo -en "\x1b\e[48;5;16m\e[38;5;207;82m$1\x1b[K\x1b[0m";}
EchoMb()    { echo -en "\x1b\e[48;5;16m\e[38;5;213;82m$1\x1b[K\x1b[0m";}
EchoYe()    { echo -en "\x1b\e[48;5;16m\e[38;5;227;82m$1\x1b[K\x1b[0m";}
EchoLb()    { echo -en "\x1b\e[48;5;16m\e[38;5;51;82m$1\x1b[K\x1b[0m"; }
EchoBl()    { echo -en "\x1b\e[48;5;16m\e[38;5;39;82m$1\x1b[K\x1b[0m"; }
EchoArray() { local -n a="$1"; for k in "${!a[@]}"; do printf "$1[%s]=%s\n" "$k" "${a[$k]}"; done; }

# ===========================================================================================================
# ===========================================================================================================
# ===========================================================================================================


main()
{
	choice=$(echo -e "cancel
logout
reboot
shutdown
suspend
lock" | dmenu -i -p 'byebye-option: ')
	echo $choice
	if [ $choice == logout ]; then
		i3-msg exit
	elif [ $choice == reboot ]; then
		reboot
	elif [ $choice == shutdown ]; then
		shutdown -h now
	elif [ $choice == suspend ]; then
		i3lock -i ~/Pictures/Wallpaper/wp_min_ski.png -t && systemctl suspend
	elif [ $choice == lock ]; then
		i3lock -i ~/Pictures/Wallpaper/wp_min_ski.png -t 
	fi
}

# ================================================================================ #
# ================================================================================ #
# ================================================================================ #

main "$@"

