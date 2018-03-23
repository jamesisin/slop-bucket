## group_count_list.sh
#! /bin/bash
# by JamesIsIn
# Do something nice today.

## this script will iterate through all the groups and print to screen group names and counts comma delimited

export gam="/home/COMPANYadmin/bin/gam/gam"

group_count=($( "${gam}" print groups | grep @COMPANY.com ))

for i in "${group_count[@]}"
    do
        printf "${i}"
        printf ","
        ( "${gam}" info group "${i}" | grep Total | cut -d ' ' -f2 | cut -d 'u' -f1 )
    done

exit
##