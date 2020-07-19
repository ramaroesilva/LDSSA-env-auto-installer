#!/bin/bash

# Bash script for creating the environments + installing packages in each 
# requirements.txt file.

# This .exe file should be placed inside the SXX folder (e.g. S01 - Bootcamp and Binary Classification),
# where all the SLU of a given month are placed.

# To run it, go to command line (or wsl in Windows) and just write "directory/venv_auto_setup.exe"
# (or change the directory, with cd, to the SXX folder you want to look at and after that run " ./venv_auto_setup.exe"

# What the script does:
# - iterates over each folder inside (one per SLU),
# - takes the number "N" of the SLU,
# - creates and activates a virtual environment named "sluN"
# - updates "pip" package
# - installs "wheel" package (don't know why, but had to do this)
# - installs the packages from the requirements.txt in the iterated slu folder
# - deactivates newly created environment
# - iterates over the next slu folder

# Note: for Windows users (such as me) it is important to create Bash scripts in 
# text editors that encode end-of-line as LF (whereas the classic Windows notepad CRLF*)
# https://support.nesi.org.nz/hc/en-gb/articles/218032857-Converting-from-Windows-style-to-UNIX-style-line-endings

yellow='\033[0;33m'
white='\033[0;m'
for dir in */; do

	echo -e ${yellow}$dir${white}

	# 4th to 6th characters from folder name to define slu number
	slu_N=${dir:3:2}
	
	# if virtual environment already exists
	if [ ! -d ~/.virtualenvs/slu$slu_N ]; then
		situation="does_not_exist"
	else
		situation="already_exists"
		
		echo "The virtual environment already seems to exist."
		echo "Do you want for it to: (1) be removed and re-created, 2) run the pip install again, or 3) do nothing?"
		
		read -p "Your option: " user_choice
	fi
		
	# if environtment already exists and user wants to do nothing, be grumpy about it and stop running code.
	if [ $situation = "already_exists" ] && [ $user_choice = "3" ]; then
		echo "Argh! Then, why did you make me get out of bed?! Sayonara, baby."
		
		break
	fi
	
	# if environtment already exists and user only wants to run pip install requirements again.
	if [ $situation = "already_exists" ] && [ $user_choice = "2" ]; then
		echo "Activating environment."
		source ~/.virtualenvs/slu$slu_N/bin/activate
		
		echo "installing required packages"
		echo "./$dir/requirements.txt"
		pip install -r "./$dir/requirements.txt"
		
		exit
	fi

	# the remaining options imply (re-)creating the virtual environtment.
	
	# option 1: if virtual environment already exists and user chooses to re-create it
	if [ $situation = "does_not_exist" ] && [ $user_choice = "1" ]; then
		echo "Deleting already existing environment."
		rm -r ~/.virtualenvs/slu$slu_N
	fi
	
	echo "(Re-)creating new environment."
	python3 -m venv ~/.virtualenvs/slu$slu_N
	
	echo "Activating environment."
	source ~/.virtualenvs/slu$slu_N/bin/activate

	echo "Updating pip and installing wheel."
	pip install -U pip
	pip install wheel

	echo "Installing required packages."
	echo "./$dir/requirements.txt"
	pip install -r "./$dir/requirements.txt"

	echo "deactivating environment"
	deactivate slu$slu_N
done
