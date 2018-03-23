## login script
#!/bin/bash


# run defaults write as currently-logged-in user

username=$(stat -f %Su /dev/console)
printf "Disabling DS_Store files for ${username} now.\n\n"
su "${username}" -c 'defaults write com.apple.desktopservices DSDontWriteNetworkStores true'

exit
##