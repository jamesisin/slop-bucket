## user_mail_forward_manager
#! /bin/bash
# by JamesIsIn
# Do something nice today.


"${gam}" user "${user_COMPANY_email}" add forwardingaddress "${manager_email}"
"${gam}" user "${user_COMPANY_email}" forward on "${manager_email}" keep

printf "\n"
printf "The user ${user_COMPANY_email} now has the following forward(s) in place:  "
printf "\n\n"
"${gam}" user "${user_COMPANY_email}" show forwardingaddresses
printf "\n\n"
"${gam}" user "${user_COMPANY_email}" show forward
printf "\n\n"

exit 0

##