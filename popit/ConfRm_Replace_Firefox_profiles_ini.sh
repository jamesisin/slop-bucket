#! /usr/bin/env bash 
# Fix Firefox profile manager error on machines with re-directed home directories. 
# by JamesIsIn 
# Do something nice today. 
## 


#Get current logged-in username. 
username=$( stat -f %Su /dev/console ) 


# Get first profile name in user's Library folder. 
profile="$( basename /home/"${username}"/Library/Application\ Support/Firefox/Profiles/* | head -1 )" 


# Empty and populate user's Firefox profiles file. 
printf "[General]\nStartWithLastProfile=1\n\n[Profile0]\nName=Default User\nIsRelative=1\n" 1>/home/"${username}"/Library/Application\ Support/Firefox/profiles.ini 
printf "Path=Profiles/""${profile}" 1>>/home/"${username}"/Library/Application\ Support/Firefox/profiles.ini 


exit 0 
## 
