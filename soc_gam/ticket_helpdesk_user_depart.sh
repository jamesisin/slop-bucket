## ticket_helpdesk_user_depart
#! /bin/bash
# by JamesIsIn
# Do something nice today.


## IT ticket to merge with HR ticket

printf "To: helpdesk@COMPANY.com
Subject: ${ticket_number} GAM off-board completed for ${user_first_name} ${user_last_name}

-------------------------------------------------------------------------------
Please note that this e-mail is automatically sent from an unmonitored mailbox
-------------------------------------------------------------------------------

IT Tasks

Google accounts have been removed.  Track this ticket against ticket ${ticket_number} to follow progress for ${user_first_name} ${user_last_name}.


Accounts:
     — LastPass
         —— (delete)
         —— https://lastpass.com/company/#/users/
     — Microsoft Office 365
         —— (delete)
         —— https://portal.office.com/adminportal/home#/homepage
     — JoinMe
         —— https://www.join.me/admin/#/
     — OnSip
         —— (remove all Resources for a user before removing the User)
         —— https://admin.onsip.com/resources
     — Atlassian
         —— (Jira & Confluence)
         —— (remove groups and de-activate)
         —— https://COMPANY.atlassian.net/admin/users
     — Github
         —— (remove from organization)
         —— https://github.com/orgs/COMPANY/people
     — LDAP
         —— (developers only)


Machine wipe:
     — Meraki (remove) 
         —— (after wiping machine)
         —— https://n44.meraki.com/


Complete procedures can be found here:
    https://COMPANY.atlassian.net/wiki/spaces/IO/pages/1972693/Employee+Termination+Procedure

Keep up the excellent work!" | ssmtp -t

exit 0

##