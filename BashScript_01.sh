#!bin/bash

<<User_Interface_Information
	Display the aailable options to the user
	Take the Selected Choice from the user
User_Interface_Information


Choice=$(echo "Create a phone dictionary\nAdd new Contact info\nDelete contact\nDelete phone dictionary\nDisplay All Contacts\nExit" | rofi -dmenu -p "Select" -normal-window -steal-focus)


if [ "${Choice}" = "Create a phone dictionary" ]; then
	ls ./PhoneDicts > Dicts.txt
	Dictionary_name=$(cat "./Dicts.txt" | rofi -dmenu -p "Select / Add Dictionary name" -normal-window -steal-focus)
	if [ -n ${Dictionary_name} ]; then
		if [ -f "${Dictionary_name}" ]; then	
			echo "* $Dictionary_name Phone Dictionary is already existing"
		else
			touch "./PhoneDicts/$Dictionary_name"
		fi
	fi
	
elif [ "${Choice}" = "Add new Contact info" ]; then
	ls ./PhoneDicts > Dicts.txt
	Dictionary_name=$(cat "./Dicts.txt" | rofi -dmenu -p "Select" -normal-window -steal-focus)
	if [ -n ${Dictionary_name} ]; then	
		Name=$(echo " " | rofi -dmenu -P "Enter Contact name : " -normal-window -steal-focus)
		Phone=$(echo " " | rofi -dmenu -P "Enter Contact Number : " -normal-window -steal-focus)
		echo "${Name}\t\t: ${Phone}" >> "./PhoneDicts/${Dictionary_name}"
	fi
	
elif [ "${Choice}" = "Display All Contacts" ]; then
	ls ./PhoneDicts > Dicts.txt
	Dictionary_name=$(cat "./Dicts.txt" | rofi -dmenu -p "Select" -normal-window -steal-focus)
	if [ -n ${Dictionary_name} ]; then	
		Name=$(cat "./PhoneDicts/${Dictionary_name}" | rofi -dmenu -normal-window -steal-focus)
	fi
	
fi
