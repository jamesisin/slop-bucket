## ConfRm Keychain Fix
#!/bin/bash


## Delete user's Keychains folder (located in redirected home directory's Library folder)

username=$(stat -f %Su /dev/console)
rm -R /home/"$username"/Library/Keychains/


exit
##