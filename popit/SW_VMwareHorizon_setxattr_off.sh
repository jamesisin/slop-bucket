## VMware Fusion backup script
# !/bin/bash
# by JamesIsIn: Do something nice today.


# Ensure extended attribute for dowloaded application (Horizon View Client) is set to off.

sudo xattr -d -r com.apple.quarantine /Applications/VMware\ Horizon\ Client.app

exit

##