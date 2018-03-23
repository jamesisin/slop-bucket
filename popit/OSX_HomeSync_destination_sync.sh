#! /bin/bash
# by JamesIsIn
## script for synchronizing com.apple.homesync.plist


# get current username
currentuser=`whoami`


# user selects current user or another

printf "\n\nBy default this script gets the com.apple.homesync.plist file and installs it for the current user ("${currentuser}").\n"

read -e -p "Please indicate the username for which you will sync this plist (leave blank for "${currentuser}"):  "
   if [ -z "$REPLY" ]; then
      printf "The default remains ""${currentuser}""."
   else
      currentuser="$REPLY"
   fi

printf "\n\nI will now synchronise the homesync plist file in /Users/${currentuser}/Library/Preferences/ from the source to this machine.\n"
read -p "Press <ENTER> to continue (ctrl-c will abort). "


# synchronize

printf "\n\nI am synchronizing this file.\n"
sudo -u ${currentuser} rsync -aiSP root@macn-nicolec:/Users/nicolecolbert/Library/Preferences/com.apple.homesync.plist /Users/${currentuser}/Library/Preferences/com.apple.homesync.plist


# fix permissions

sudo bash <<EOF
chown ${currentuser}:"POP\Domain Users" /Users/${currentuser}/Library/Preferences/com.apple.homesync.plist
chmod 600 /Users/${currentuser}/Library/Preferences/com.apple.homesync.plist

EOF
exit
##