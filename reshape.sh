#!/usr/bin/env bash
#
#     __   ______    	+-------------------------------------------------+
#    /\ \ /\  __ \   	| Author:   Julius Arnold                         |
#   _\_\ \\ \  __ \	| E-Mail:   julius.arnold@hotmail.com             |
#  /\_____\\ \_\ \_\ 	| GitHub:   https://github.com/JuliusArnold       |
#  \/_____/ \/_/\/_/	+-------------------------------------------------+
#
# Open vpn from dmenu

main()
{
choice=$(echo -e "hd
mun
laptop
dkfz
auto" | dmenu -i -p 'Reshape Location: ')
echo $choice

if [ $choice == hd ]; then
	reshape_hd
#elif [ $choice == hd2 ]; then
#	reshape_hd2
elif [ $choice == mun ]; then
 	reshape_mun
elif [ $choice == laptop ]; then
	reshape_laptop
elif [ $choice == dkfz ]; then
	reshape_dkfz	
elif [ $choice == auto ]; then
	reshape_auto
fi
}

reshape_auto()
{
	xrandr --auto
}
reshape_dkfz()
{
	xrandr --output eDP-1 --scale 1x1
	xrandr --output DP-2 --scale 1x1
	xrandr --output DP-2 --right-of eDP-1
	xrandr --output eDP-1 --mode 1920x1080
	#exec --no-starup-id i3-msg 'workspace 9; exec /opt/cisco/anyconnect/bin/vpnui'
}


reshape_hd()
 {
	xrandr --output eDP-1 --scale 1x1
	xrandr --output HDMI-1 --scale 1x1
	 #xrandr --prop | grep "[^dis]connected" | cut --delimiter=" " -f1> "$HOME/currentScreens.txt"
	 #echo "Number of active screens:" $(< "$HOME/currentScreens.txt" wc -l)
	 #if [ $(< "$HOME/currentScreens.txt" wc -l) -gt 1 ]; then
	 #   xrandr --auto && xrandr --output $(cat "$HOME/currentScreens.txt" | awk 'NR==1') --primary
	 #   xrandr --auto && xrandr --output $(cat "$HOME/currentScreens.txt" | awk 'NR==2') --right-of $(cat "$HOM    E/currentScreens.txt" | awk 'NR==1')
	 #else   
	 #   echo "Nothing to do"
	 #fi
	xrandr --output HDMI-1 --left-of eDP-1
	xrandr --output eDP-1 --scale 0.6x0.6
	xrandr --output HDMI-1 --scale 1x1
	 #reshape_laptop
	 #rm "$HOME/currentScreens.txt"
 }


reshape_laptop()
{
	choice2=$(echo -e "0.3
0.4
0.5
0.6
0.7
0.8
0.9
1
1920x1080" | dmenu -i -p 'Size of Laptop: ')
	echo xrandr --output eDP-1 --scale ${choice2}x${choice2}
	if [ $choice2 = 1920x1080 ]; then
    xrandr --output eDP-1 --mode $choice2
  else
    xrandr --output eDP-1 --scale ${choice2}x${choice2}
  fi
}


reshape_mun()
{
	xrandr --auto
	xrandr --output HDMI-1 --rotate inverted
	xrandr --output HDMI-1 --right-of eDP-1
	xrandr --output HDMI-1 --scale 0.6x0.6
	xrandr --output eDP-1 --mode 1920x1080
}

# ==================================================================================== #
# ==================================================================================== #
# ==================================================================================== #
main "@"
