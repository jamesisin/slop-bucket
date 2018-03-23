## Office2011+Office2016 purge-interactive
#!/bin/bash
# by JamesIsIn
# Do something nice today.

printf "\n\n"
printf "This script must be run as root or using sudo."
printf "\n\n"

## Removing the application files

# Remove /Applications/Microsoft Office 2011/
printf "\n\n"
printf "We will now remove the Office folder from /Applications/ and any application which begins \"Microsoft \"."
printf "\n"
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
# 2011
rm -R /Applications/Microsoft\ Office\ 2011/
rm -R /Applications/Microsoft\ Communicator.app/
rm -R /Applications/Microsoft\ Messenger.app/
rm -R /Applications/Remote\ Desktop\ Connection.app/
# 1016
rm -R /Applications/Microsoft\ Excel.app/
rm -R /Applications/Microsoft\ OneNote.app/
rm -R /Applications/Microsoft\ Outlook.app/
rm -R /Applications/Microsoft\ PowerPoint.app/
rm -R /Applications/Microsoft\ Word.app/


## Removing other files and folders

# Remove com files
printf "\n\n"
printf "We will now remove com files from each user's ~/Library/Preferences folder."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm /Users/*/Library/Preferences/com.microsoft.*
rm /Private/var/root/Library/Preferences/com.microsoft.*

# Remove launch daemon plist
printf "\n\n"
printf "We will now remove plist from /Library/LaunchDaemons/."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm /Library/LaunchDaemons/com.microsoft.office.licensing.helper.plist

# Remove helper file
printf "\n\n"
printf "We will now remove the helper file from /Library/PrivilegedHelperTools/."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm /Library/PrivilegedHelperTools/com.microsoft.office.licensing.helper

# Remove com files from ~/Library/Preferences/ByHost/
printf "\n\n"
printf "We will now remove the com files from each user's ~/Library/Preferences/ByHost/ folder."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm /Users/*/Library/Preferences/ByHost/com.microsoft.*
rm /Private/var/root/Library/Preferences/ByHost/com.microsoft.*

# Remove /Library/Application Support/Microsoft/
printf "\n\n"
printf "We will now remove the Microsoft folder from /Library/Application Support/."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm -R /Library/Application\ Support/Microsoft/

# Remove Office 2011 related files from /Library/Receipts/
printf "\n\n"
printf "We will now remove the Office 2011 related files from /Library/Receipts/."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm -R /Library/Receipts/Microsoft/

# Remove com files from /private/var/db/receipts/
printf "\n\n"
printf "We will now remove the com files from /private/var/db/receipts/."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm /private/var/db/receipts/com.microsoft.*

# Remove each user's ~/Library/Application Support/Microsoft/Office/ folder
printf "\n\n"
printf "We will now remove each user's ~/Library/Application Support/Microsoft/Office/ folder."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm -R /Users/*/Library/Application\ Support/Microsoft/Office/
rm -R /Private/var/root/Library/Application\ Support/Microsoft/Office/

# Remove /Library/Fonts/Microsoft/
printf "\n\n"
printf "We will now remove /Library/Fonts/Microsoft/."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm -R /Library/Fonts/Microsoft/

# Remove each user's /Documents/Microsoft User Data/ folder
printf "\n\n"
printf "We will now remove each user's ~/Documents/Microsoft User Data/ folder."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm -R /Users/*/Documents/Microsoft\ User\ Data/
rm -R /Private/var/root/Documents/Microsoft\ User\ Data/


# Added 20151028 for 1016
printf "\n\n"
printf "We will now remove each user's com files from their ~/Containers/ folder."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm -R /Users/*/Library/Containers/com.microsoft*
rm -R /Private/var/root/Library/Containers/com.microsoft*

# Added 20151028 for 1016
printf "\n\n"
printf "We will now remove each user's Office related folders from their Group Containers folder."
read -p "Press <ENTER> to continue (or ctrl-C will abort)."
rm -Rf /Users/*/Library/Group\ Containers/UBF8T346G9.ms
rm -Rf /Users/*/Library/Group\ Containers/UBF8T346G9.Office
rm -Rf /Users/*/Library/Group\ Containers/UBF8T346G9.OfficeOsfWebHost
rm -Rf /Private/var/root/Library/Group\ Containers/UBF8T346G9.ms
rm -Rf /Private/var/root/Library/Group\ Containers/UBF8T346G9.Office
rm -Rf /Private/var/root/Library/Group\ Containers/UBF8T346G9.OfficeOsfWebHost


## Good advice

printf "\n\n"
printf "Good-bye."
printf "\n"
printf "You should now reboot your system.  You may then re-install Office if you'd like."
printf "\n\n"

exit
##