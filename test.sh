#!/usr/bin/env bash
#
#     __   ______    	+-------------------------------------------------+
#    /\ \ /\  __ \   	| Author:   Julius Arnold                         |
#   _\_\ \\ \  __ \	| E-Mail:   julius.arnold@hotmail.com             |
#  /\_____\\ \_\ \_\ 	| GitHub:   https://github.com/JuliusArnold       |
#  \/_____/ \/_/\/_/	+-------------------------------------------------+
#
#

dir=""
choice="/home/julius/"
echo $choice


while [ $choice != "s" ];do
	dir=$dir$choice
	if [ $choice == "u" ]; then
		echo back #TODO make option to get one one dir
	fi
	options=$(cd $dir && ls -d */ )

	#if [ no_of_dir > ${#options[@]} ]; then 
	#	echo TEST
	#fi

	choice=$(echo -e "${options[@]}
select 
s
../" | dmenu -i -p 'Directories: ' )

	echo $dir

done



prog_opt=$(echo -e "vim
vlc 
o" | dmenu -i -p 'Programm: ')
echo $prog_opt


files=$(cd $dir && ls )

file=$(echo -e "${files[@]}
./
../" | dmenu -i -p 'Files ' )
dir=$dir$file

if [ $prog_opt == "vim" ]; then
	gnome-terminal -- nvim $dir
elif [ $prog_opt == "vlc" ]; then
	vlc $dir
elif [ $prog_opt == "o" ]; then
	xdg-open $dir
fi
