## user_depart_groups_purge
#! /bin/bash
# by JamesIsIn
# Do something nice today.


# pull user information
# awk for groups
# cut lead-in and trailing data to get alias for group

"${gam}" user "${user_COMPANY_email}" delete groups

printf "\n"
printf "I will display all remaining groups:  "
printf "\n"
"${gam}" info user "${user_COMPANY_email}" | awk '/Groups:/{flag=1;next}/Licenses:/{flag=0}flag' | cut -d '<' -f2 | cut -d '>' -f1
printf "\n"
printf "If that is empty and there were no errors, all is well."
printf "\n"

exit 0

##