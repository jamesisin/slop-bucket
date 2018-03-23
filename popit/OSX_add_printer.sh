##
#!/bin/bash


## Add printer from list for Mac
#

# Set initial states of all variables.

allprinters=( 
                "Sea 5S Copy Room HP Plotter" #1
                "Sea 5S Copy Room BW Konica PCL" #2
                "Sea 5S Copy Room Color Konica PCL" #3
                "Sea 5S Copy Room BW Konica PS" #4
                "Sea 5S Copy Room Color Konica PS" #5
                "Sea 8 Copy Room BW Konica PCL" #6
                "Sea 8 Copy Room Color Konica PCL" #7
                "Sea 5N IT Room Epson" #8
                "Sea 5N IT Room Xerox" #9
                "Sea 5N NE Fire Escape HP" #10
                "Sea 5N NW Offices HP" #11
                "Sea 5N Office Brother" #12
                "Sea 5S Main Room Center Xerox" #13
                "Sea 5S Main Room E Xerox" #14
                "Sea 5S Main Room W Xerox" #15
                "Sea 5S SW Corner HP" #16
                "Sea 5S Pettibon Xerox" #17
                "Sea 5S Office Samsung" #18
                "Sea 5S Office 43 Xerox" #19
                "Sea 5S Office 45 HP" #20
                "Sea 5S Office 46 Xerox" #21
                "Sea 5S Office 47 Brother" #22
                "Sea 8 Between Pods 1 & 2 Xerox" #23
                "Sea 8 Between Pods 2 & 3 HP" #24
                "Sea 8 S of Pod 4 Xerox" #25
                "Sea 8 Between Pods 5 & 6 Xerox" #26
                "Sea 8 N of Pod 6 Xerox" #27
                "Sea 8 SW Corner HP" #28
                "Sea 8 Office 116 Brother" #29
                "Sea 8 Office 117 HP" #30
                "Sea 8 Office 118 Brother" #31
                "Sea 8 Office 119 Xerox" #32
                "Sea 8 Office 120 Brother" #33

                )

selectedprinter=()
printer=()
location=()
ip=()
localdriver="/System/Library/Frameworks/ApplicationServices.framework/Frameworks/PrintCore.framework/Resources/Generic.ppd" # some printers will require a different driver to be specified
printprotocol=ipp # certain printers may change this to lpd where necessary
workingdirectory="$( cd "$( dirname "$0" )" && pwd )"
konicadriver="/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTAC652DS.gz"
plotterdriver="$workingdirectory""/HPPlotter" # not working yet

osversion=$( sw_vers | grep 'ProductVersion:' | grep -o '10.[7-8]' ) # the OS version is needed for the Konica driver installation


# Offer list of pretty names to user

echo 
echo "Please select a printer and enter that number."
echo "Out of range or non-numeric responses will be ignored."
echo "Q will quit the script."
echo

select selectedprinter in "${allprinters[@]}"; do
    [[ $REPLY = Q ]] && echo "No printer added.  Good-bye." && exit 0

# Use pretty name to construct all necessary variables.
# [[ $REPLY = 1 ]] && location="" printer="$location" ip="" && break
# Where 1 is the array element number, printer currently is the same as location,
# and all four variables are used to build commands

    [[ $REPLY = 1 ]]     && location="Sea5SCopyRoomHPPlotter"                printer="$location" ip="192.168.5.167"     localdriver="$plotterdriver" && break # needs driver path
    [[ $REPLY = 2 ]]     && location="Sea5SCopyRoomBWKonicaPCL"        printer="$location" ip="192.168.6.83"         localdriver="$konicadriver" && sudo cp -r $workingdirectory/Drivers/$osversion/ /Library/Printers/ && sudo chmod -R 777 /Library/Printers/KONICAMINOLTA && sudo chmod -R 777 /Library/Printers/PPDs/Contents/Resources/ && break
    [[ $REPLY = 3 ]]     && location="Sea5SCopyRoomColorKonicaPCL"     printer="$location" ip="192.168.6.83"         localdriver="$konicadriver" && sudo cp -r $workingdirectory/Drivers/$osversion/ /Library/Printers/ && break
    [[ $REPLY = 4 ]]     && location="Sea5SCopyRoomBWKonicaPS"            printer="$location" ip="192.168.6.83"         localdriver="$konicadriver" && sudo cp -r $workingdirectory/Drivers/$osversion/ /Library/Printers/ && break
    [[ $REPLY = 5 ]]     && location="Sea5SCopyRoomColorKonicaPS"        printer="$location" ip="192.168.6.83"         localdriver="$konicadriver" && sudo cp -r $workingdirectory/Drivers/$osversion/ /Library/Printers/ && break
    [[ $REPLY = 6 ]]     && location="Sea8CopyRoomBWKonicaPCL"         printer="$location" ip="192.168.5.10"         localdriver="$konicadriver" && sudo cp -r $workingdirectory/Drivers/$osversion/ /Library/Printers/ && break
    [[ $REPLY = 7 ]]     && location="Sea8CopyRoomColorKonicaPCL"         printer="$location" ip="192.168.5.10"         localdriver="$konicadriver" && sudo cp -r $workingdirectory/Drivers/$osversion/ /Library/Printers/ && break
    [[ $REPLY = 8 ]]     && location="Sea5NITRoomEpson"                            printer="$location" ip="192.168.6.89"         && break
    [[ $REPLY = 9 ]]    && location="Sea5NITRoomXerox"                            printer="$location" ip="192.168.6.87"         && break
    [[ $REPLY = 10 ]]     && location="Sea5NNEFireEscapeHP"                    printer="$location" ip="192.168.6.96"         && break
    [[ $REPLY = 11 ]]     && location="Sea5NNWOfficesHP"                            printer="$location" ip="192.168.6.98"         && break
    [[ $REPLY = 12 ]]     && location="Sea5NOfficeBrother"                            printer="$location" ip="192.168.7.29"         && break
    [[ $REPLY = 13 ]]     && location="Sea5SMainRoomCenterXerox"            printer="$location" ip="192.168.6.81"         && break
    [[ $REPLY = 14 ]]     && location="Sea5SMainRoomEXerox"                    printer="$location" ip="192.168.6.80"         && break
    [[ $REPLY = 15 ]]     && location="Sea5SMainRoomWXerox"                    printer="$location" ip="192.168.6.82"         && break
    [[ $REPLY = 16 ]]     && location="Sea5SSWCornerHP"                            printer="$location" ip="192.168.6.92"         && break
    [[ $REPLY = 17 ]]     && location="Sea5SPettibonXerox"                            printer="$location" ip="192.168.6.84"         && break
    [[ $REPLY = 18 ]]     && location="Sea5SOfficeSamsung"                        printer="$location" ip="192.168.6.94"         && break
    [[ $REPLY = 19 ]]     && location="Sea5SOffice43Xerox"                            printer="$location" ip="192.168.6.91"         && break
    [[ $REPLY = 20 ]]     && location="Sea5SOffice45HP"                                printer="$location" ip="192.168.6.184"     && break
    [[ $REPLY = 21 ]]     && location="Sea5SOffice46Xerox"                            printer="$location" ip="192.168.6.88"         && break
    [[ $REPLY = 22 ]]     && location="Sea5SOffice47Brother"                        printer="$location" ip="192.168.6.126"     && break
    [[ $REPLY = 23 ]]     && location="Sea8BetweenPods12Xerox"                printer="$location" ip="192.168.5.106"     && break
    [[ $REPLY = 24 ]]     && location="Sea8BetweenPods23HP"                    printer="$location" ip="192.168.5.104"     printprotocol=lpd && break
    [[ $REPLY = 25 ]]     && location="Sea8SofPod4Xerox"                            printer="$location" ip="192.168.5.102"     && break
    [[ $REPLY = 26 ]]     && location="Sea8BetweenPods56Xerox"                printer="$location" ip="192.168.6.105"     && break
    [[ $REPLY = 27 ]]     && location="Sea8NofPod6Xerox"                            printer="$location" ip="192.168.5.109"     && break
    [[ $REPLY = 28 ]]    && location="Sea8SWCornerHP"                             printer="$location" ip="192.168.5.103"     && break
    [[ $REPLY = 29 ]]     && location="Sea8Office116Brother"                        printer="$location" ip="192.168.7.101"     && break
    [[ $REPLY = 30 ]]    && location="Sea8Office117HP"                             printer="$location" ip="192.168.5.174"     && break
    [[ $REPLY = 31 ]]     && location="Sea8Office118Brother"                        printer="$location" ip="192.168.7.100"     && break
    [[ $REPLY = 32 ]]     && location="Sea8Office119Xerox"                            printer="$location" ip="192.168.5.142"     && break
    [[ $REPLY = 33 ]]     && location="Sea8Office120Brother"                        printer="$location" ip="192.168.7.102"     && break

    [[ $selectedprinter ]] || continue

done


selectedprinter[REPLY]=$selectedprinter
echo
echo "$selectedprinter?"
echo
echo "You have selected a wonderful printer."
echo "I will now install it as $printer."
echo


# Use pretty name to construct all necessary variables.


read -p "Press <ENTER> to coninue.  (Ctrl-C will abort.)"



# do shell script "/usr/sbin/lpadmin -p $printer -L '$location' -E -v ipp://$ip -P $driver"
echo
echo "lpadmin -p $printer -L $location -E -v $printprotocol://$ip -P $localdriver"
echo
lpadmin -p "$printer" -L "$location" -E -v $printprotocol://"$ip" -P "$localdriver"

exit 0