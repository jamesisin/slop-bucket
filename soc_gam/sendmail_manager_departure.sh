## sendmail_manager_departure
#! /bin/bash
# by JamesIsIn
# Do something nice today.


## Manager Departure Notification

printf "To: ${manager_email}
Subject: ${ticket_number} Google account for ${user_first_name} ${user_last_name}

-------------------------------------------------------------------------------
Please note that this e-mail is automatically sent from an unmonitored mailbox
-------------------------------------------------------------------------------

Hi ${manager_first_name},

IT has deactivated the Google account for ${user_first_name} ${user_last_name} and completed the following administrative cleanup tasks:

- Their email has been forwarded AND delegated to you
- Any conference rooms reserved by this account have been released for others to book
- Ownership of any shared Google Drive files for ${user_first_name} has been transferred to you
- The account has been scheduled for permanent deletion on ${account_deletion_date}

These steps have been taken to ensure that no important emails or documents are lost before ${user_first_name}'s responsibilities can be handed off to someone else.  If you have any questions, please contact helpdesk@COMPANY.com.

Notes

* You can access the delegated account by clicking on your profile picture in the upper-right corner of your Gmail page and then clicking on your delegate's email address.
* You can learn more about mail delegation here: https://support.google.com/mail/answer/138350?hl=en.
* Email sent to ${user_COMPANY_email} will be returned as undeliverable once the account has been deleted." | ssmtp -t

exit 0

##