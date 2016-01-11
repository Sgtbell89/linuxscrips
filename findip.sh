#!/bin/bash

echo "enter domain name"
read DOMAINNAME
ping -c1 $DOMAINNAME
nslookup $DOMAINNAME | grep "Address: " | awk '{ print $2 }' 


