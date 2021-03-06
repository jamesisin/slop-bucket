## Conf Mac setup script
#!/bin/bash 


## Disable Fast User Switching.

defaults write /Library/Preferences/.GlobalPreferences MultipleSessionEnabled -bool NO
# To read the FUS setting:
# defaults read /Library/Preferences/.GlobalPreferences | grep MultipleSession


## Add Keychain icon to Menu Bar.

open "/Applications/Utilities/Keychain Access.app/Contents/Resources/Keychain.menu"
# If needed , the icon may be enabled via ssh:
# ssh root@mac-conf-test2274 'open /Applications/Utilities/Keychain\ Access.app/Contents/Resources/Keychain.menu'


## Add LockScreen message.

defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Please return to Company, Inc\nAddress; Address too; San Rafael, Escazú zip; San José, Costa Rica\n+phone"


# To read the current message
# defaults read /Library/Preferences/com.apple.loginwindow LoginwindowText

# If needed, the LockScreen message may be set via ssh:
# ssh root@mac-conf-test2274 'defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Please return to Company, Inc\nAddress; Address too; San Rafael, Escazú zip; San José, Costa Rica\n+phone"'


exit
##