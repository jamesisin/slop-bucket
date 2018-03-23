## user Keychain fix
#!/bin/bash


## Delete user's Keychains folder (located in /Users/[username]/Library folder)

username=$(stat -f %Su /dev/console)
rm -R /Users/"$username"/Library/Keychains/


exit
##