#!/bin/zsh



### find out what time zone to check ###
echo "What time zone would you like to set to? Please enter the corresponding location...."
echo "1. Arizona"
echo "2. California"
echo "3. Texas"
echo "4. Florida"

read location

case $location in
 
  1)
    systemsetup -settimezone America/Phoenix
    ;;

  2)
    systemsetup -settimezone America/Los_Angeles
    ;;

  3)
    systemsetup -settimezone America/Chicago
    ;;

  4)
    systemsetup -settimezone America/New_York
    ;;
esac
