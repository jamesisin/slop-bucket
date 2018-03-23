## user_delegate_mail_manager
#! /bin/bash
# by JamesIsIn
# Do something nice today.


while true # test loop for delegation success
    do
        # Delegating ${user_COMPANY_email} mailbox to ${manager_email}
        "${gam}" user "${user_COMPANY_email}" delegate to "${manager_email}"
        # test success of delegation
        if ! ( "${gam}" user "${user_COMPANY_email}" show delegate | grep -q "Delegate Email: ${manager_email}" )
            then
                printf "\n"
                printf "Looks like delegation failed."
                printf "\n\n"
                printf "Would you like to try again or do it manually?"
                printf "\n"
                read -p "Enter N to go manual or anything else to try again.  " tryagain
                # try again or give up
                if [[ "${tryagain}" == "N" ]] ;
                    then
                        printf "\n"
                        printf "Below is your manual command.  Copy that into a text file for later or run it in a separate terminal."
                        printf "\n\n"
                        printf "'"${gam}" user "${user_COMPANY_email}" delegate to "${manager_email}"'"
                        printf "\n"
                    break
                fi
        else break
        fi
    done

exit 0

##