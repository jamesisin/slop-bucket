## 
#!/bin/bash 


# parse third octet of IP range 
for (( thirdoctet=6 ; thirdoctet < 8 ; thirdoctet++ )) ; do 

# parse fourth octet of IP address 
for (( fourthoctet=1 ; fourthoctet < 255 ; fourthoctet++ )) ; do 

# execute command 

nslookup 192.168."$thirdoctet"."$fourthoctet" 

read -p "Do you want to adjust this machine?  [ Y, n, or exit ] " 
   if [ "$REPLY" = "exit" ]; then 
      exit 
   elif [ "$REPLY" = "N" ]; then 
      echo Ok 192.168."$thirdoctet"."$fourthoctet" has been skipped. 
      echo 
   elif [ "$REPLY" = "n" ]; then 
      echo Ok 192.168."$thirdoctet"."$fourthoctet" has been skipped. 
      echo 
   else 
      ssh root@192.168."$thirdoctet"."$fourthoctet" 'defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Return to POP, Inc 206-728-7997\n1326 Fifth Avenue, Suite 800\nSeattle, WA 98101"' ; 
   fi 

# close for-loop for fourthoctet and then for thirdoctet 
done # fourthoctet 
done # thirdoctet 


exit 