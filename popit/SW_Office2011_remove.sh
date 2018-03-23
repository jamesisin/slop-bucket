## User Mac setup script
#!/bin/bash 

printf "\n\nThis script must be run as root or using sudo.\n\n"

## Removing the application files

# Remove /Applications/Microsoft Office 2011/
printf "\n\nWe will now remove the Office folder from /Applications/.\n"
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm -R /Applications/Microsoft\ Office\ 2011/

# Remove /Applications/Microsoft Communicator.app
printf "\n\nWe will now remove Communicator from /Applications/."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm -R /Applications/Microsoft\ Communicator.app/

# Remove /Applications/Microsoft Messenger.app
printf "\n\nWe will now remove Messenger from /Applications/."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm -R /Applications/Microsoft\ Messenger.app/

# Remove /Applications/Remote Desktop Connection.app
printf "\n\nWe will now remove Remote Desktop Connection from /Applications/."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm -R /Applications/Remote\ Desktop\ Connection.app/


## Removing other files and folders

# Remove com files
printf "\n\nWe will now remove com files from each user's ~/Library/Preferences folder."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm /Users/*/Library/Preferences/com.microsoft.*

# Remove launch daemon plist
printf "\n\nWe will now remove plist from /Library/LaunchDaemons/."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm /Library/LaunchDaemons/com.microsoft.office.licensing.helper.plist 

# Remove helper file
printf "\n\nWe will now remove the helper file from /Library/PrivilegedHelperTools/."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm /Library/PrivilegedHelperTools/com.microsoft.office.licensing.helper 

# Remove com files from ~/Library/Preferences/ByHost/
printf "\n\nWe will now remove the com files from each user's ~/Library/Preferences/ByHost/ folder."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm /Users/*/Library/Preferences/ByHost/com.microsoft.*

# Remove /Library/Application Support/Microsoft/
printf "\n\nWe will now remove the Microsoft folder from /Library/Application Support/."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm -R /Library/Application\ Support/Microsoft/

# Remove Office 2011 related files from /Library/Receipts/
printf "\n\nWe will now remove the Office 2011 related files from /Library/Receipts/."
printf "(These files may not exist and as such this may return a no such file error.)"
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm -R /Library/Application\ Support/Microsoft/

# Remove com files from /private/var/db/receipts/
printf "\n\nWe will now remove the com files from /private/var/db/receipts/."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm /private/var/db/receipts/com.microsoft.*

# Remove each user's ~/Library/Application Support/Microsoft/Office/ folder
printf "\n\nWe will now remove each user's ~/Library/Application Support/Microsoft/Office/ folder."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm -R /Users/*/Library/Application\ Support/Microsoft/Office/

# Remove /Library/Fonts/Microsoft/
printf "\n\nWe will now remove /Library/Fonts/Microsoft/."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm -R /Library/Fonts/Microsoft/

# Remove each user's /Documents/Microsoft User Data/ folder
printf "\n\nWe will now remove each user's ~/Documents/Microsoft User Data/ folder."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm -R /Users/*/Documents/Microsoft\ User\ Data/


## Good advice

printf "\n\nGood-bye.\n"
printf "You should now reboot your system.  You may then re-install Office if you'd like.\n\n"

exit
##