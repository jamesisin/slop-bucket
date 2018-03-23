## Mac Sophos duplicate culling script
#!/bin/bash
# by JamesIsIn
# 20160622


## grep unique string ending in ] and used sed to append the next line to the specified file

sed -i.bkp '/ManagementAgent]/a\
"DomainNameOverride"="POP"\
' /Library/Sophos\ Anti-Virus/RMS/agent.config


# Re-launch the RMS agent

sudo killall -HUP sophosManagementAgent


exit=0

##