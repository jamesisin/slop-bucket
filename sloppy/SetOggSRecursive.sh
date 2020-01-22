## 
#!/bin/bash 
# by JamesIsIn from JamesIsIn.com 
# Do something nice today.  


## gather information 

# obtain directory in which to work 

printf "\nHello.\n\n" 
read -e -p "Please provide the root folder under which I will work recursively:  " 
	if [ -d "$REPLY" ] ; then 
		printf '%s\n' "I have confirmed this is a directory.  " "" 
		directory="$REPLY" 
	else 
		printf '%s\n' "I cannot confirm this is a directory.  " "" 
		exit 1 
	fi 

## do the work 

# parse files into array recursively 
 
find "$directory" -type f -name '*.[Ff][Ll][Aa][Cc]' > /tmp/whyme 

declare -a flacfind 
	let i=0 
	while read flacline ; do 
		flacfind[$i]=$flacline 
		((i++)) 
	done < /tmp/whyme 

# use array to build OggS command 

for (( i=0 ; i < ${#flacfind[@]} ; i++ )) ; do 
		## OggS\ Set.app/Contents/MacOS/Set\ OggS ~/Music/iTunes/iTunes\ Music/_0_0_Flac/FlacOther/_0_0_Various/Aural\ Sects/01.\ Keoki\ -\ Me.flac  
		echo "I am attempting to set OggS for ${#flacfind[@]} files.  " 
		OggS\ Set.app/Contents/MacOS/Set\ OggS "${flacfind[i]}" ; 
	done 

## clean-up 

printf '%s\n' "" "" "I have completed all operations to the best of my ability.\nI will now clean up all files.  " "" 
read -p "Press <ENTER> to coninue.  " 

# remove temp files and unset all variables 

rm /tmp/whyme* 
unset 

exit 0 

## 
