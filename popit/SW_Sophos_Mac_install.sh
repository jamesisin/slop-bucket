#! /bin/bash
## by JamesIsIn


# Uncomment these next two lines for an interactive script.
# printf "This script must be run as root or using sudo.\n\n"
# read -e -p "Please press [ENTER] to begin."

# declare variables
workdir="/.popit/.temp/"
payload="ESCOSX"
curlserver="http://corp-vs-sec1/S010/"

# work
curl -o "${workdir}""${payload}.zip" "${curlserver}""${payload}"
unzip "${workdir}""${payload}.zip" -d "${workdir}"
sudo chmod 644 "${workdir}""${payload}Sophos Installer.app/Contents/MacOS/tools/InstallationDeployer"
sudo "${workdir}""${payload}Sophos Installer.app/Contents/MacOS/tools/InstallationDeployer" --install

# configure auto-updates for Sophos
sudo launchctl unload /Library/LaunchDaemons/com.sophos.managementagent.plist /Library/LaunchDaemons/com.sophos.messagerouter.plist
sudo rm -f /Library/Caches/com.sophos.rms/agent.private
sudo rm -f /Library/Caches/com.sophos.rms/router.private
sudo launchctl load /Library/LaunchDaemons/com.sophos.messagerouter.plist /Library/LaunchDaemons/com.sophos.managementagent.plist

# house cleaning
sudo rm -R "${workdir}""${payload}"
sudo rm "${workdir}""${payload}.zip"


exit 0
##