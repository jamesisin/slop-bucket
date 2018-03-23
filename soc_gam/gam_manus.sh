## gam menus
#! /bin/bash
# by JamesIsIn
# Do something nice today.


# two menus
declare -i main_menu_choice=0
declare -i submenu_choice=0

# where is gam?
export gam="/home/COMPANYadmin/bin/gam/gam"

# COMPANY calendars in GCal
export events_of_interest_calendar="COMPANY.com_s63pkb8epfjqfoskjpcg971v1o@group.calendar.google.com"
export vacation_and_travel_calendar="COMPANY.com_v30c42fukg3ibtrieu7tek1e14@group.calendar.google.com"

# this is temporary and should be altered or removed for final production version
# not clear where the subscripts folder is on the server at present anyway
declare -l path_to_subscript_folder="/usr/local/bin/scripts/gammsubs/"

# calculate 30 day account deletion date
export account_deletion_date=$( date -d "+30 days" +%Y.%m.%d )

# declare remaining variables
declare random_password_new=""
declare random_password_depart=""
declare -l group_email=""
declare -l location_group=""
declare -l manager_email=""
declare manager_first_name=""
declare -l dept_group=""
declare user_first_name=""
declare user_last_name=""
declare -l user_personal_email=""
declare -l user_COMPANY_email=""
declare -i ticket_number=""
declare -i start_date=""
declare -i end_date=""


while true
    do
        clear

        printf "\n"
        printf "In order to track this work let's get the ticket number."
        printf "\n\n"
        printf "From which ticket are you working?"
        printf "\n\n"
        read -p "Please type the four-digit ticket number:  " ticket_number
        
        export ticket_number

        # random password generation
        export random_password_new=$( openssl rand -base64 12 )
        export random_password_depart=$( openssl rand -base64 32 )

        clear

        # former main_menu function
        printf "\n"
        printf "**** MAIN MENU ****"
        printf "\n\n"
        printf "1) New employee (on-boarding)"
        printf "\n"
        printf "2) Departing employee (off-boarding)"
        printf "\n"
        printf "3) Set up mail forward"
        printf "\n"
        printf "4) TEST - Add Testy"
        printf "\n"
        printf "5) TEST - Delete Testy"
        printf "\n"
        printf "6) TEST - Create facilities ticket"
        printf "\n"
        printf "0) Quit"
        printf "\n\n"
        printf "Ticket Number:  ${ticket_number}"
        printf "\n\n"
        read -p "Enter selection:  " main_menu_choice

        case "${main_menu_choice}" in
            # New employee (on-boarding)
            1)
                printf "\n"
                read -p "To start, what is the first name of this new user?  " user_first_name
                read -p "And the surname for ${user_first_name}?  " user_last_name
                read -p "And what is the COMPANY e-mail address for ${user_first_name}?  " user_COMPANY_email
                read -p "What is the personal e-mail address for ${user_first_name} (get this from Bamboo)?  " user_personal_email
                read -p "What is the start date for this new user?  (Please use this format: 20171131)  " start_date
                
                export user_first_name user_last_name user_personal_email user_COMPANY_email start_date

                # former location_menu function
                printf "\n"
                printf "Select the work location for the user"
                printf "\n\n"
                printf "1) DC"
                printf "\n"
                printf "2) Seattle"
                printf "\n"
                printf "3) Remote"
                printf "\n"
                printf "4) UK"
                printf "\n\n"
                printf "Ticket Number:  ${ticket_number}"
                printf "\n\n"
                read -p "Enter selection:  " submenu_choice

                case "${submenu_choice}" in
                    1)
                        location_group="dc-l@COMPANY.com" ;;
                    2)
                        location_group="seattle-l@COMPANY.com" ;;
                    3)
                        location_group="remote-employees-us-l@COMPANY.com" ;;
                    4)
                        location_group="uk-employees-l@COMPANY.com" ;;
                        # UK is not currenlty a menu item
                esac
                
                export location_group


                # former team_menu function
                printf "\n"
                printf "Which department will this user join?"
                printf "\n\n"
                printf "1) Customer Success"
                printf "\n"
                printf "2) Engineering"
                printf "\n"
                printf "3) G&A"
                printf "\n"
                printf "4) IT"
                printf "\n"
                printf "5) Marketing"
                printf "\n"
                printf "6) Sales"
                printf "\n"
                printf "7) Security"
                printf "\n\n"
                printf "Ticket Number:  ${ticket_number}"
                printf "\n\n"
                read -p "Enter selection:  " submenu_choice

                case "${submenu_choice}" in
                    1)
                        dept_group="customer-success@COMPANY.com" ;; 
                    2)
                        dept_group="engineering@COMPANY.com" ;; 
                    3)
                        dept_group="genadmin-l@COMPANY.com" ;; 
                    4)
                        dept_group="it@COMPANY.com" ;; 
                    5)
                        dept_group="marketing@COMPANY.com" ;; 
                    6)
                        dept_group="sales-internal@COMPANY.com" ;; 
                    7)
                        dept_group="security-l@COMPANY.com" ;; 
                esac
                
                export dept_group

                printf "\n"
                printf "Create user:  "
                printf "\n"
                ( exec "${path_to_subscript_folder}"user_new_create.sh )
                printf "\n"
                printf "Message to COMPANY account:  "
                printf "\n"
                ( exec "${path_to_subscript_folder}"sendmail_user_new_COMPANY.sh )
                printf "\n"
                printf "Message of welcome:  "
                printf "\n"
                ( exec "${path_to_subscript_folder}"sendmail_user_new_welcome.sh )
                printf "\n"
                printf "Message to People Ops:  "
                printf "\n"
                ( exec "${path_to_subscript_folder}"sendmail_hr_newuser.sh )
                printf "\n"
                printf "Ticket to Helpdesk:  "
                printf "\n"
                ( exec "${path_to_subscript_folder}"ticket_helpdesk_user_new.sh )
                printf "\n"
                printf "Add calendars:  "
                printf "\n"
                ( exec "${path_to_subscript_folder}"user_new_calendars_add.sh )

                printf "\n\n"
                printf "Google onboarding is now complete."
                printf "\n\n"
                printf "Please include the user's temporary password in their welcome letter:  "
                printf "\n\n"
                printf "${random_password_new}"
                printf "\n\n"
                read -p "Press [ENTER] to continue... " ;;

            # Departing employee (off-boarding)
            2)
                printf "\n"
                read -p "We will need the first name of the user who is leaving:  " user_first_name
                read -p "And what is the surname for ${user_first_name}?  " user_last_name
                read -p "Please provide the e-mail address with COMPANY for ${user_first_name}:  " user_COMPANY_email
                read -p "What is the first name of their manager:  " manager_first_name
                read -p "Finally, let us also have the e-mail address for ${manager_first_name}:  " manager_email
                read -p "What is the end date for this new user?  (Please use this format: 20171131)  " end_date

                export user_first_name user_last_name user_COMPANY_email manager_email manager_first_name end_date
                                
                printf "\n"
                printf "Purge groups:  "
                printf "\n"
                ( exec "${path_to_subscript_folder}"user_depart_purge_groups.sh )
                printf "\n"
                printf "Purge user's calendar:  "
                printf "\n"
                ( exec "${path_to_subscript_folder}"user_depart_calendar_purge.sh )
                printf "\n"
                printf "Disable IMAP:  "
                printf "\n"
                ( exec "${path_to_subscript_folder}"user_mail_disable_imap.sh )
                printf "\n"
                printf "Disable POP:  "
                printf "\n"
                ( exec "${path_to_subscript_folder}"user_mail_disable_pop.sh )
                printf "\n"
                printf "Deprovision:  "
                printf "\n"
                ( exec "${path_to_subscript_folder}"user_depart_deprovision.sh )
                printf "\n"
                printf "Transfer Drive ownership:  "
                printf "\n"
                ( exec "${path_to_subscript_folder}"user_drive_ownership_manager.sh )
                printf "\n"
                printf "Mail delegation:  "
                printf "\n"
                ( exec "${path_to_subscript_folder}"user_delegate_mail_manager.sh )
                printf "\n"
                printf "Message to manager:  "
                printf "\n"
                ( exec "${path_to_subscript_folder}"sendmail_manager_departure.sh )
                printf "\n"
                printf "Message to facilities:  "
                printf "\n"
                ( exec "${path_to_subscript_folder}"sendmail_facilities_user_depart.sh )
                printf "\n"
                printf "Set random password:  "
                printf "\n"
                ( exec "${path_to_subscript_folder}"user_depart_password_random.sh )
                printf "\n"
                printf "Ticket to Helpdesk:  "
                printf "\n"
                ( exec "${path_to_subscript_folder}"ticket_helpdesk_user_depart.sh )
                
                printf "\n"
                printf "The user ${user_COMPANY_email} has departed:  accounts TERMINATED."
                printf "\n"
                printf "Please make note of any errors above before continuing."
                printf "\n\n"
                read -p "Press [ENTER] key to continue... " ;;
                

            3)
                printf "\n"
                read -p "We will need the first name of the user who is leaving:  " user_first_name
                read -p "And what is the surname for ${user_first_name}?  " user_last_name
                read -p "Please provide the e-mail address with COMPANY for ${user_first_name}:  " user_COMPANY_email
                read -p "What is the first name of their manager:  " manager_first_name
                read -p "Finally, let us also have the e-mail address for ${manager_first_name}:  " manager_email

                export user_first_name user_last_name user_COMPANY_email manager_email manager_first_name

                ( exec "${path_to_subscript_folder}"user_mail_forward_manager.sh )

                printf "\n"
                printf "Forwarding work has completed."
                printf "\n\n"
                read -p "Press [ENTER] key to continue... " ;;

            # TEST - Add Testy
            4)
                export user_COMPANY_email="Testy.McTesterton@COMPANY.com" user_first_name="Testy" user_last_name="McTesterton"

                ( exec "${path_to_subscript_folder}"user_new_create.sh )

                printf "\n"
                printf "Testy lives.  Snu-be-doo-be-doo."
                printf "\n\n"
                read -p "Press [ENTER] to continue... " ;;


            # TEST - Delete Testy
            5)
                export user_COMPANY_email="Testy.McTesterton@COMPANY.com"
                
                ( exec "${path_to_subscript_folder}"user_depart_deletion.sh )

                printf "\n"
                printf "Testy is no more."
                printf "\n\n"
                read -p "Press [ENTER] to continue... " ;;
                

            # TEST - Send email
            6)
                export user_first_name="Testy" user_last_name="McTesterton"

                ( exec "${path_to_subscript_folder}"ticket_facilities_cleandesk.sh )

                printf "\n"
                printf "A Snu-mail test message has been sent."
                printf "\n\n"
                read -p "Press [ENTER] to continue... " ;;
                

            # Quit
            0)
                printf "\n"
                printf "Quitting.  Ciao."
                printf "\n\n"
                exit 0 ;;

            # renegade user mashing keys
            *)
                printf "\n"
                printf "So sorry but ${main_menu_choice} does not appear in the menu."
                printf "\n"
                printf "Please select an option from the supplied list."
                printf "\n"
                read -p "Press [ENTER] to continue... " ;;
                

        esac
    done

exit 0

##