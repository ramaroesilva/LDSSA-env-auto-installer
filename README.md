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
- from the folder name, takes the number "N" of the SLU,
- if the environment named "sluN" already exists, asks if the user wants to either:
    1) remove the existing environment and re-create it (create + pip install - U pip + pip install requirements.txt),
    2) only re-run the pip install requirements.txt, or 
    3) do nothing
- iterates over the next slu folder

Note: for Windows users (such as me) it is important to create Bash scripts in 
text editors that encode end-of-line as LF (whereas the classic Windows notepad CRLF*)
https://support.nesi.org.nz/hc/en-gb/articles/218032857-Converting-from-Windows-style-to-UNIX-style-line-endings
