#! /bin/bash
## script for obscuring MiniLauncher file

if [ -f /System/Library/CoreServices/Setup\ Assistant.app/Contents/SharedSupport/MiniLauncher ]; then
    if [ -f /System/Library/CoreServices/Setup\ Assistant.app/Contents/SharedSupport/MiniLauncher.old ]; then
        rm /System/Library/CoreServices/Setup\ Assistant.app/Contents/SharedSupport/MiniLauncher.old
    fi; 
    mv /System/Library/CoreServices/Setup\ Assistant.app/Contents/SharedSupport/MiniLauncher /System/Library/CoreServices/Setup\ Assistant.app/Contents/SharedSupport/MiniLauncher.old
fi

exit
##