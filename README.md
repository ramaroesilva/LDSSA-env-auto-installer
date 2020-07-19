# LDSSA-env-auto-installer

(Copied from the .exe file comments)

Bash script for creating the environments + installing packages in each 
requirements.txt file.

This .exe file should be placed inside the SXX folder (e.g. S01 - Bootcamp and Binary Classification),
where all the SLU of a given month are placed.

To run it, go to command line (or wsl in Windows) and just write "directory/venv_auto_setup.exe"
(or change the directory, with cd, to the SXX folder you want to look at and after that run " ./venv_auto_setup.exe"

What the script does:
- iterates over each folder inside (one per SLU),
- takes the number "N" of the SLU,
- creates and activates a virtual environment named "sluN"
- updates "pip" package
- installs "wheel" package (don't know why, but had to do this)
- installs the packages from the requirements.txt in the iterated slu folder
- deactivates newly created environment
- iterates over the next slu folder

Note: for Windows users (such as me) it is important to create Bash scripts in 
text editors that encode end-of-line as LF (whereas the classic Windows notepad CRLF*)
https://support.nesi.org.nz/hc/en-gb/articles/218032857-Converting-from-Windows-style-to-UNIX-style-line-endings
