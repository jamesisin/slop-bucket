## user_new_calendars_add
#! /bin/bash
# by JamesIsIn
# Do something nice today.
# former add_calendar_to_list function

while true # test loop for calendar add success
    do
        # Adding ${user_COMPANY_email} to ${events_of_interest_calendar}
        sleep 15 # pause because Google is slow
        "${gam}" user "${user_COMPANY_email}" add calendar "${events_of_interest_calendar}" selected true
        # test success of add
        if ! ( "${gam}" user "${user_COMPANY_email}" show calendars | grep -q "${events_of_interest_calendar}" )
            then
                printf "
                Looks like the COMPANY Events of Interest calendar didn't add.
                
                Would you like to try again or do it manually?
                "
                read -p "Enter N to go manual or anything else to try again.  " tryagain
                # try again or give up
                if "${tryagain}" = "N"
                    then
                        printf "
                        Below is your manual command.  Copy that into a text file for later or run it in a separate terminal.
                        
                        '"${gam}" user "${user_COMPANY_email}" add calendar "${events_of_interest_calendar}" selected true'
                        "
                    break
                fi
        else break
        fi
    done




while true # test loop for calendar add success
    do
        # Adding ${user_COMPANY_email} to ${vacation_and_travel_calendar}
        sleep 15 # pause because Google is slow
        "${gam}" user "${user_COMPANY_email}" add calendar "${vacation_and_travel_calendar}" selected true
        # test success of add
        if ! ( "${gam}" user "${user_COMPANY_email}" show calendars | grep -q "${vacation_and_travel_calendar}" )
            then
                printf "
                Looks like the Vacation and Travel calendar didn't add.
                
                Would you like to try again or do it manually?
                "
                read -p "Enter N to go manual or anything else to try again.  " tryagain
                # try again or give up
                if "${tryagain}" = "N"
                    then 
                        printf "
                        Below is your manual command.  Copy that into a text file for later or run it in a separate terminal.
                        
                        '"${gam}" user "${user_COMPANY_email}" add calendar "${vacation_and_travel_calendar}" selected true'
                        "
                        break
                fi
        else break
        fi
    done

exit 0

##