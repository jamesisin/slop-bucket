#! /bin/bash
# by JamesIsIn


# If a machine is built with a name of a previous machine in the Sophos database,
# it may be necessary (even after including it in the correct OU)
# to run this script to reset Sophos.


# Run as root.


launchctl unload /Library/LaunchDaemons/com.sophos.managementagent.plist /Library/LaunchDaemons/com.sophos.messagerouter.plist
rm -f /Library/Caches/com.sophos.rms/agent.private
rm -f /Library/Caches/com.sophos.rms/router.private
launchctl load /Library/LaunchDaemons/com.sophos.messagerouter.plist /Library/LaunchDaemons/com.sophos.managementagent.plist


exit
##