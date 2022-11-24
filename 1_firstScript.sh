#!/bin/bash


### This Script Prints System Info ### 
echo "Welcome to my first bash script"
echo 


# Checking uptime
echo "################################"
echo "The uptime of the system is: "
echo 

uptime

echo
# Checking Memory
echo "################################"
echo "Memory Utilization"
echo

free -m -h

echo

# Checking Memory
echo "################################"
echo "Disk Utilization"
echo

df -h
