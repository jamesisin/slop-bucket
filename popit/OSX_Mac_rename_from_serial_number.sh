## Mac rename via serial number script
#!/bin/bash
# by JamesIsIn
# Do something nice today.

# set two variables (fully qualified is a suggestion and not a strict requirement)

fullyqualified=".fhcrc.org"
serialnumber="$(/usr/sbin/system_profiler SPHardwareDataType | /usr/bin/awk '/Serial\ Number/ { print $NF; }')"


# change name in all three places (see note above concerning $fullyqualified)

/usr/sbin/scutil --set ComputerName "${serialnumber}"
/usr/sbin/scutil --set LocalHostName "${serialnumber}"
/usr/sbin/scutil --set HostName "${serialnumber}${fullyqualified}"

exit
##