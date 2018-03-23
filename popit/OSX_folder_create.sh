#! /bin/bash
# by JamesIsIn


## create helpdesk working directories
if [ -d /.popit ]; then
      printf "\n\nThere is already a .popit folder.\n"
   else sudo mkdir /.popit
fi

if [ -d /.popit/.temp ]; then
   printf "\n\nThere is already a .temp folder.\n"
   else sudo mkdir /.popit/.temp
 fi

 
#move other stuff to this directory
if [ -d /POPIT ]; then
      mv /POPIT/* /.popit/
      rmdir /POPIT
   elif [ -d /POPHelpdesk ]; then
      mv /POPHelpdesk/* /.popit/
      rmdir /POPHelpdesk
   else printf "\nNo /POPIT nor /POPHelpdesk folder.\n\n"
fi


exit
##