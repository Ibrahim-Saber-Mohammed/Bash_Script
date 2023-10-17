#!/bin/bash

Dir="/home/ibrahim/Desktop/GitHubRepos/Bash_Script/VS_Code_Script"

if [ -f "${Dir}/Projects.txt" ];  then
	touch  "${Dir}/Projects.txt"
fi

Projects=$(cat "${Dir}/Projects.txt")

Project_Path=$(echo "${Projects}" | rofi -dmenu -p "Select/Add" -normal-window -steal-focus)

if [ ${Project_Path} = "Add" ]; then
	Path=$(echo " " | rofi -dmenu -p "Enter Path: " -normal-window -steal-focus)
	if [ -n "${Path}" ]; then
		echo "${Path}" >> "${Dir}/Projects.txt"
	fi
elif [ -n ${Project_Path} ]; then
	code "${Project_Path}"
fi

