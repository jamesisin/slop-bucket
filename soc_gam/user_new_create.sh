## user_new_create
#! /bin/bash
# by JamesIsIn
# Do something nice today.


# create new user and set mandatory change for new password
"${gam}" create user "${user_COMPANY_email}" firstname "${user_first_name}" lastname "${user_last_name}" password "${random_password_new}" changepassword on


if ! [ "${user_COMPANY_email}" = "testy.mctesterton@COMPANY.com" ] ; then

    # give new user group memberships
    "${gam}" update group "${location_group}" add member user "${user_COMPANY_email}"
    "${gam}" update group "${dept_group}" add member user "${user_COMPANY_email}" ;

else printf "\n" 
     printf "\Testy gets no groups."
     printf "\n" ;
fi

exit 0

##