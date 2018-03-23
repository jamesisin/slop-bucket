## ticket_helpdesk_user_new
#! /bin/bash
# by JamesIsIn
# Do something nice today.


## IT ticket to merge with HR ticket

printf "To: helpdesk@COMPANY.com
Subject: ${ticket_number} GAM on-board completed for ${user_first_name} ${user_last_name}

-------------------------------------------------------------------------------
Please note that this e-mail is automatically sent from an unmonitored mailbox
-------------------------------------------------------------------------------

IT Tasks

Google accounts have been created.  Track this ticket against ticket ${ticket_number} to follow progress for ${user_first_name} ${user_last_name}.

Please obtain the e-mail address for this user's manager from Bamboo, and assign this ticket to that manager.


Accounts:
     — Okta
         —— (log in as admin to confirm import)
         —— https://COMPANY-admin.okta.com/admin/users
     — Atlassian
         —— (Confluence for everyone; Jira by request)
         —— https://COMPANY.atlassian.net/admin/users
     — LastPass
         —— (assign groups:  AllUsers & pick a department group)
         —— https://lastpass.com/company/#/users/
     — Microsoft Office 365
         —— https://portal.office.com/adminportal/home#/homepage
     — JoinMe
         —— (by request only)
         —— https://www.join.me/admin/#/

Machine build:
     — Meraki
         —— (assign machine to user)
         —— https://n44.meraki.com/
     — Bamboo
         —— (locate user and add to Asset tab)
         —— https://COMPANY.bamboohr.com/employees/directory.php


Complete procedures can be found here:
    https://COMPANY.atlassian.net/wiki/spaces/IO/pages/1970747/Employee+On-Boarding+Procedure

Keep up the excellent work!" | ssmtp -t

exit 0

##