#! /bin/bash
## by JamesIsIn


# declare variables
workdir="/.popit/.temp/"
payload="joinme"
curlserver="https://secure.join.me/Download.aspx?installer=mac"

# work
curl -o "${workdir}""${payload}.zip" "${curlserver}"
sudo rm -R /Applications/join.me.app
sudo unzip "${workdir}""${payload}.zip" -d /Applications/
sudo chmod 755 /Applications/join.me.app

# house cleaning
sudo rm "${workdir}""${payload}.zip"

# update dock
sudo defaults write com.apple.dock persistent-apps -array-add '<dict><key>title-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/join.me.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
sudo killall Dock


exit 0
##