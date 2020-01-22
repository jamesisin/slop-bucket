#!/bin/bash
# Prepend album number before track numbers
# by JamesIsIn from JamesIsIn.com
# Do something nice today.


## gather information

printf '%s\n' "" "This script will change file names based on a containing folder and a prepending string which you supply.  " 
printf '%s\n' "You will want to ensure the script has been altered to fit your needs (check the coded file extension).  " 
printf '%s\n' "Example:  If you provide '01' as your prepend.  " 
printf '%s\n' "Example:  Then '01 - Track Name.flac' will become '01.01 - Track Name.flac'  " "" 

read -e -p "I will require the path to the containing folder:  " 
	if [ -d "$REPLY" ] ; then 
		printf '%s\n' "I have confirmed this is a directory.  " "" 
		directory="$REPLY" 
	else
		printf '%s\n' "I cannot find this directory." "" 
		printf '%s\n' "$REPLY" 
		printf '%s\n' 
		exit 1 
	fi 

read -p "What is the string you wish to prepend?  " 
	printf '%b\n' "" "I will prepend '$REPLY' to all files (of the extension specified in the script) contained within '$directory'  " "" 
	newname=$REPLY 

read -p "Press <ENTER> to continue (ctrl-c will abort).  " 
	printf '\n' 

cd "$directory" 

# You must modify the end of the following line to conform to the files you are wanting to prepend.  
# Using a single * will change folder names, 
# but understand it will also change any and all files located in the target directory as well.  

rename "s/^/$newname/" * 
#rename "s/^/$newname./" *.[Gg][Ii][Ff] #[Cc] 

exit 0 

#for filename in *.[Ff][Ll][Aa][Cc]; do 
#   mv "$filename" "$newname.$filename" 
#   printf '%s\n' $filename changed 
#done 

## 
