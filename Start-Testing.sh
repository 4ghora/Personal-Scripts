#!/bin/bash

# Check the number of command-line arguments
if [ "$#" -eq 1 ]; then
    platform="$1"
    Challange="$2"
elif [ "$#" -eq 2 ]; then
    platform="$1"
    Challange="$2"
else
    # Prompt user for input if not provided as command-line arguments
    echo "Use 1 For TryHackMe "
    echo "Use 2 For HackTheBox"
    echo "Use 3 For PortSwiggers"
    read -p "Where Are You Testing: " platform
    read -p "Name Of The Challenge: " Challange
fi

# Function to create directory structure and notes file
code() {
    current_user=$(whoami)
    # Create directory structure and notes file
    commands="mkdir -p /home/$current_user/CTFS/Testing-Area/$1/$2/scans && touch /home/$current_user/CTFS/Testing-Area/$1/$2/notes.txt"
    eval "$commands"
    # Print directory information and instructions for tmux session
    echo -e "\nFolder For This Challenge Is Available At: \n/home/$current_user/CTFS/Testing-Area/$1/$2\n"
    echo -e "To Start A Tmux Session Use Command: \ntmux new-session -c /home/$current_user/CTFS/Testing-Area/$1/$2 -s $2"
}

# Check the platform and call the code function with appropriate parameters
if [ "$platform" == "1" ]; then
    code "TryHackMe" $Challange

elif [ "$platform" == "2" ]; then
    code "HackTheBox" $Challange

elif [ "$platform" == "3" ]; then
    code "Portswigger" $Challange

else
    echo "Unexpected Input. Please Retry."
fi
