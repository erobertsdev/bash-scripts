#!/bin/bash

# This script will ping a range of IP addresses and report which ones are up.
# It will also report the hostname of the machine if it is up.
for ip in 192.168.220.{1..254}; do
  ping -c 1 $ip | grep "64 bytes" | cut -d " " -f 4 | sed 's/.$//'
done

# Alternate version
if [ "$1" == "" ]
then
echo "You forgot an IP address!"
echo "Syntax: ./ipsweep.sh 192.168.1"
else
for ip in `seq 1 254`; do
 ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
done
fi