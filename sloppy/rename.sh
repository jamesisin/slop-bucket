## 
#!/bin/bash 
# Substitute one string for another within a file name 
# by JamesIsIn from JamesIsIn.com 
# Do something nice today.  

#for filename in * 
for filename in *.png 
#for filename in */*.[Mm][Pp]3 
#for filename in */*.[Oo][Gg][Gg] 
	do 
	mv "$filename" "${filename/box/}" 
	printf '%s\n' $filename changed 
done 

exit 0 

#  - – 

## 

#for filename in * 
for filename in *.[Ff][Ll][Aa][Cc] 
#for filename in *.[Mm][Pp]3 
#for filename in *.[Oo][Gg][Gg] 
	do 
	mv "$filename" "${filename/ - *.flac/.flac}" 
	printf '%s\n' "$filename changed  " 
done 

exit 0 

# a nested version for parsing one folder below 
# some replacements require "$foldername"/"${filename/ while others do not 

for foldername in * 
	do 
		for filename in "$foldername"/*.jpg 
		# for filename in *.[Mm][Pp]3 
		# for filename in *.[Oo][Gg][Gg] 
		do 
		mv "$filename" "$foldername"/"${filename/*.jpg/cover.jpg}" 
		printf '%s\n' "$filename changed  " 
	done 
done 

exit 0 

## 
