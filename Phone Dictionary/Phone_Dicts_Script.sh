#!/bin/bash

<<User_Interface_Information
	Display the aailable options to the user
	Take the Selected Choice from the user
User_Interface_Information

if [ ! -d "./PhoneDicts" ]; then
	mkdir "./PhoneDicts"
fi

Choice=$(echo -e "Create a phone dictionary\nAdd new Contact info\nDelete contact\nDelete All Contacts\nDelete phone dictionary\nDisplay All Contacts\nExit" | rofi -dmenu -p "Select" -normal-window -steal-focus)
if [ "${Choice}" = "Create a phone dictionary" ]; then
	ls ./PhoneDicts > "./Dicts.txt"
	Dictionary_name=$(cat "./Dicts.txt" | rofi -dmenu -p "Select / Add Dictionary name" -normal-window -steal-focus)
	if [ -n ${Dictionary_name} ]; then
		if [ ! -f "${Dictionary_name}" ]; then	
			touch "./PhoneDicts/$Dictionary_name"
		fi
	fi
	
elif [ "${Choice}" = "Add new Contact info" ]; then
	ls ./PhoneDicts > "./Dicts.txt"
	Dictionary_name=$(cat "./Dicts.txt" | rofi -dmenu -p "Select" -normal-window -steal-focus)
	if [ -n ${Dictionary_name} ]; then	
		Name=$(echo " " | rofi -dmenu -P "Enter Contact name : " -normal-window -steal-focus)
		if [ -n ${Name} ]; then
			Phone=$(echo " " | rofi -dmenu -P "Enter Contact Number : " -normal-window -steal-focus)
			if [ -n ${Phone} ]; then
				echo -e "${Name}\t: ${Phone}" >> "./PhoneDicts/${Dictionary_name}"
			else
				echo "You should Enter a valid Contact Number"
			fi
		else
			echo "You should Enter a valid Contact name"
		fi
		
	fi
	
elif [ "${Choice}" = "Display All Contacts" ]; then
	ls ./PhoneDicts > "./Dicts.txt"
	Dictionary_name=$(cat "./Dicts.txt" | rofi -dmenu -p "Select" -normal-window -steal-focus)
	if [ -n ${Dictionary_name} ]; then	
		Name=$(cat "./PhoneDicts/${Dictionary_name}" | rofi -dmenu -p " " -normal-window -steal-focus)
	fi

elif [ "${Choice}" = "Delete contact" ]; then
	ls ./PhoneDicts > "./Dicts.txt"
	Dictionary_name=$(cat "./Dicts.txt" | rofi -dmenu -p "Select" -normal-window -steal-focus)
	if [ -n ${Dictionary_name} ]; then	
		Name=$(cat "./PhoneDicts/${Dictionary_name}" | rofi -dmenu -p "Select :"-normal-window -steal-focus)
		sed -i /"${Name}"/d ./PhoneDicts/${Dictionary_name} #Delete the line containning the selected name 
	fi
	
elif [ "${Choice}" = "Delete All Contacts" ]; then
	ls ./PhoneDicts > "./Dicts.txt"
	Dictionary_name=$(cat "./Dicts.txt" | rofi -dmenu -p "Select" -normal-window -steal-focus)
	if [ -n ${Dictionary_name} ]; then	
		echo > ./PhoneDicts/${Dictionary_name}
	fi
	
fi

