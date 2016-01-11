#!/bin/bash


#ifconfig is eth0 for gathering IP info interface.
#grep "inet addr:" filters output for IPv4
#awk '{ print $2 "}' to print out only column 2
#cut -d: -f2 uses colon as the deliminator and selction from second column.

echo "Enter the interface you would like"
ifconfig | grep "eth"
ifconfig | grep "wlan"
echo
read INTERFACENAME

ifconfig $INTERFACENAME | grep "inet addr:" | awk '{ print $2 }'| cut -d: -f2



