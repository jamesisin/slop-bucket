## User profile archiving script for SEA
#!/bin/bash

#
printf "\n\nThis script is for archiving in SEA."
printf "\n\nYou must be logged in as root for this to function as expected.  Please ensure you have done so."
printf "\n(Running under sudo as another user may encounter permissions issues.)\n"

# get username
printf "\n"
read -e -p "Please provide the username of the user for whom you would like to archive the profile from this machine:  "
if [[ "${REPLY}" =~ ^[A-Za-z_]+$ ]]; then
   # fix case
   username="$( echo "${REPLY}" | tr '[A-Z]' '[a-z]' )"
   homedirectory="/Users/${username}/"
   if [ -d "${homedirectory}" ]; then
      printf "\nI have found a home directory for that user on this machine."
   else
      printf "\nThat username does not appear to match a user directory on this machine."
       exit 1
   fi
else
   printf "\nThat does not appear to be a valid username.\n\n"
   exit 1
fi

# get workstationadministrator
printf "\n"
read -e -p "What is your username?  "
if [[ "${REPLY}" =~ ^[A-Za-z_]+$ ]]; then
   # fix case
   workstationadministrator="$( echo "${REPLY}" | tr '[A-Z]' '[a-z]' )"
else
   printf "\nYour username does not appear to be a valid username.\n\n"
   exit 1
fi

# get e-mail address for notification
printf "\n"
read -e -p "What is the beginning of your e-mail address (we will add \"@popagency.com\" for you)?  "
mail="${REPLY}"
printf "\nWe will send notifications to ${mail}@popagency.com concerning this archiving.\n"

# mount archive/username/workstationarchive as current workstationadmin user
mountpoint="/Volumes/workstationarchive/"
mkdir "${mountpoint}"
   if [ -d "${mountpoint}" ]; then
      printf "\nI have confirmed this is a directory.\n"
   else
      printf "\nThis is not a directory?\n"
       exit 1
   fi
# the old way
#fixstupid="POP;${workstationadministrator}"
#mount -t smbfs //"${fixstupid}"@corp-artico2.popmultimedia.com/users\$/"${username}"/workstationarchive "${mountpoint}"
# the new old way
#fixstupid="POP;${workstationadministrator}"
mount -t smbfs //"${workstationadministrator}"@corp-artico2.popmultimedia.com/userarchive\$/"${username}"/workstationarchive "${mountpoint}"
# the new way
#mount -t smbfs //"${workstationadministrator"@archive.popmultimedia.com/users\$/"${username}"/workstationarchive "${mountpoint}"


# optionally remove user's .Trash folder
#printf "\nYou should consider very carefully before deleting the Trash folder of this user."
#printf "\nIf you are uncertain, do NOT do it."
#printf "\n"
#read -e -p "Would you like to permanently remove the .Trash folder for this user before you archive the profile?  (This is NOT reversible.)  [yes/NO]  "
#deleteTrash="$( echo "${REPLY}" | tr '[A-Z]' '[a-z]' )"
#     if [[ "${deleteTrash}" = yes ]]; then
#          printf "\nI am deleting the ${homedirectory}/.Trash folder and its contents\n"
#          rm -Rf "${homedirectory}/\.Trash"
#     else
#          printf "\nOk.  I will leave the .Trash folder which will now be archived.\n"
#     fi
#printf "\n"


# preferably remove user's Library folder
printf "\nUsually there is no need to keep the Library folder for any particular user."
printf "\nUnless there is a specific reason let me delete it."
printf "\n"
read -e -p "Would you like to permanently remove the Library folder for this user before you archive the profile?  [YES/no]  "
deleteLibrary="$( echo "${REPLY}" | tr '[A-Z]' '[a-z]' )"
     if [[ "${deleteLibrary}" = no ]]; then
          printf "\nOk.  I will leave the Library folder which will now be archived.\n"
     else
          printf "\nI am deleting the ${homedirectory}/Library folder and its contents.\n"
          rm -Rf "${homedirectory}/Library"
     fi
printf "\n"


read -e -p "Hit [ENTER] to begin archiving.  "

# while/read loop start
runagain=y
while [ "${runagain}" = "y" ]
do

     # confirm mount
     if [ `stat -fc%d:%T "${mountpoint}"` != `stat -fc%d:%T "${mountpoint}/.."` ]; then
          printf "${mountpoint} is mounted.\n\n"
     else
          printf "${mountpoint} is not mounted.\n\n"
          exit 1
     fi

     # rsync stuff

     rsync -aSP --remove-source-files --exclude 'Library/' "${homedirectory}" "${mountpoint}"/macprofile/

# while/read loop continued
     printf "Sending mail..."
     mail -s "Check user archive status" < /dev/null "${mail}"@popagency.com
     printf "\n"
     read -e -p "Do you want to go again? [y/N]  "
     runagain="$( echo "${REPLY}" | tr '[A-Z]' '[a-z]' )"
     if [[ "${runagain}" = y ]]; then
          printf "Ok!\n"
     elif [[ "${runagain}" = yes ]]; then
          runagain=y
          printf "\nOk!  Here we go.\n"
     else
          printf "\nLet's move on then.\n"
          variable=n
     fi
done


# optional archiving of Fusion VM
printf "\n"
read -e -p  "Does this user have any Fusion machines which will need to be archived? [y/N]  "
archivevm="$( echo "${REPLY}" | tr '[A-Z]' '[a-z]' )"
vmpath="/VirtualMachines/"
   # while/read loop start
   vmrunagain=y
   while [ "${vmrunagain}" = "y" ]
   do
   if [[ "${archivevm}" = y ]]; then
      printf "\nPlease provide the location where the virtual machines are stored (/VirtualMachines/ is the default location)."
       printf "\n"
      read -e -p "Press [ENTER] to accept or type a new full path.  "
      rsync -aSP --remove-source-files "${vmpath}"/ "${mountpoint}"/FusionVM/
   elif [[ "${archivevm}" = yes ]]; then
      printf "\nPlease provide the location where the virtual machines are stored (/VirtualMachines/ is the default location)."
       printf "\n"
      read -e -p "Press [ENTER] to accept or type a new full path.  "
      rsync -aSP --remove-source-files "${vmpath}"/ "${mountpoint}"/FusionVM/
   else
      printf "\nI will not archive any virtual machines then.\n"
   fi

# while/read loop continued
     printf "Sending mail..."
     mail -s "\nCheck VM archive status" < /dev/null "${mail}"@domain.com
     printf "\n\n"
     read -e -p "Do you want to go again? [y/N]  "
     vmrunagain="$( echo "${REPLY}" | tr '[A-Z]' '[a-z]' )"
     if [[ "${vmrunagain}" = y ]]; then
          printf "Ok!\n"
     elif [[ "${vmrunagain}" = yes ]]; then
          vmrunagain=y
          printf "\nOk!  Here we go.\n"
     else
          printf "\nCiao!\n\n"
          variable=n
     fi
done

umount "${mountpoint}"

exit 0
##