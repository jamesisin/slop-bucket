## group_count_list.sh
#! /bin/bash
# by JamesIsIn
# Do something nice today.

## this script will take a source and destination group
## then iterate through the members to add source members to destination

export gam="/home/COMPANYadmin/bin/gam/gam"

printf "\n\n"
printf "This script will take your source group members and add those members to your destination group."
printf "\n"
printf "You need not supply the @COMPANY.com but rather only the beginning."
printf "\n\n"

read -p "Please provide a source group alias:  " source_group

read -p "Now let's have a destination alias:  " destination_group

printf "\n\n"

source_members=($( "${gam}" info group "${source_group}" | grep member: | cut -d ':' -f2 | cut -d ' ' -f2 | cut -d ' ' -f1))

for i in "${source_members[@]}"
    do
        "${gam}" update group "${destination_group}" add member user "${i}"
    done

printf "\n\n"
printf "Done with migration-duplication."
printf "\n\n"

exit
##