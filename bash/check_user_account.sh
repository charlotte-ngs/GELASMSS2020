#!/bin/sh
###
###
###
###   Purpose:   Shell scripts to check whether user account exists
###   started:   2020/02/17 (pvr)
###
### ##################################################### ###

#Set Script Name variable
SCRIPT=`basename ${BASH_SOURCE[0]}`
echo " *** Start cloning with $SCRIPT ..."


### # functions
usage () {
  local l_MSG=$1
  echo "Usage Error: $l_MSG"
  echo "Usage: $SCRIPT -s <string>"
  echo "  where <string> specifies username of the student"
  exit 1
}


### Start getopts code ###
#Parse command line flags
#If an option should be followed by an argument, it should be followed by a ":".
#Notice there is no ":" after "h". The leading ":" suppresses error messages from
#getopts. This is required to get my unrecognized option code to work.
while getopts :s: FLAG; do
  case $FLAG in
    s) # set option "t"
    STUDENT=$OPTARG
    HOMEDIR=/home/$STUDENT
    [ -d "${HOMEDIR}" ] || usage "Cannot find student home: $HOMEDIR"
	  ;;
    *) # invalid command line arguments
	  usage "Invalid command line argument $OPTARG"
	  ;;
  esac
done  


echo "check done"
