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
dkfz" | dmenu -i -p 'Reshape Location: ')
echo $choice

if [ $choice == hd ]; then
	reshape_hd
#elif [ $choice == hd2 ]; then
#	reshape_hd2
elif [ $choice == mun ]; then
 	reshape_mun
elif [ $choice == laptop ]; then
	reshape_laptop
elif [ $choice == laptop ]; then
	echo res	
fi
}


reshape_hd2()
{
	xrandr --auto
	xrandr --output HDMI-1 --left-of eDP-1
	xrandr --output HDMI-1 --scale 0.6x0.6
	xrandr --output eDP-1 --scale 0.6x0.6

}
reshape_hd()
 {
	 xrandr --prop | grep "[^dis]connected" | cut --delimiter=" " -f1> "$HOME/currentScreens.txt"
	 echo "Number of active screens:" $(< "$HOME/currentScreens.txt" wc -l)
	 if [ $(< "$HOME/currentScreens.txt" wc -l) -gt 1 ]; then
	    xrandr --auto && xrandr --output $(cat "$HOME/currentScreens.txt" | awk 'NR==1') --primary
	    xrandr --auto && xrandr --output $(cat "$HOME/currentScreens.txt" | awk 'NR==2') --right-of $(cat "$HOM    E/currentScreens.txt" | awk 'NR==1')
	 else   
	    echo "Nothing to do"
	 fi
	 xrandr --output HDMI-1 --left-of eDP-1
	 reshape_laptop
	 rm "$HOME/currentScreens.txt"
 }







reshape_laptop()
{
	xrandr --output eDP-1 --scale 0.6x0.6
}

reshape_mun()
{
	xrandr --auto
	xrandr --output HDMI-1 --rotate inverted
	xrandr --output HDMI-1 --right-of eDP-1
	xrandr --output HDMI-1 --scale 0.6x0.6
	xrandr --output eDP-1 --scale 0.6x0.6
}

# ==================================================================================== #
# ==================================================================================== #
# ==================================================================================== #
main "@"
