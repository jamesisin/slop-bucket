## Random password generation plus insertion thereof into a plist file
# modify as necessary
# by JamesIsIn
# 20160308
#!/bin/bash


plistfile="Desktop/plistfile"
charset='a-zA-Z0-9`~!@#$%^&*()-=+;:,<.>/?\"|\_'
randpass=`export LC_CTYPE=C; cat /dev/urandom | tr -dc "${charset}" | fold -w 10 | head -n 1`

printf “\n\n”
printf "${randpass}"
printf “\n\n"

printf "<?xml version=/\"1.0/\" encoding=/\"UTF-8/\"?><!DOCTYPE plist PUBLIC /\"-//Apple//DTD PLIST 1.0//EN/\" /\"http://www.apple.com/DTDs/PropertyList-1.0.dtd/\"><plist version=/\"1.0/\"><dict><key>Username</key><string>filevaultsyncronizer</string><key>Password</key><string>lo9KI8Juwl</string><key>AdditionalUsers</key><array><dict><key>Username</key><string>poplocaladmin</string><key>Password</key><string>${randpass}</string></dict></array></dict></plist>" > "${plistfile}"

exit

##