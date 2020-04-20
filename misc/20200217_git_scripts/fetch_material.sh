#!/bin/bash

SCRIPTDIR=/home/quagadmin/source/misctools/github
DIRTOFETCH=ex/w09
# DIRTOFETCH=sol/w07

#' fetch individual directory
#' change to progdir
cd $SCRIPTDIR

#' fetch for test student
cat /home/quagadmin/user_admin/students-gelasmss2020/test-student-usernames-gelasmss2020 | while read s
do 
  echo " * Student: $s"
  ./fetch.sh -s $s -d $DIRTOFETCH
  sleep 2
done

#' fetch for real students
cat /home/quagadmin/user_admin/students-gelasmss2020/student-usernames-gelasmss2020 | while read s
do 
  echo " * Student: $s"
  ./fetch.sh -s $s -d $DIRTOFETCH
  sleep 2
done

# check content
cat /home/quagadmin/user_admin/students-gelasmss2020/student-usernames-gelasmss2020 | while read s
do 
  echo " * Student: $s"
  ls -l /home/$s/GELASMSS2020/$DIRTOFETCH
  sleep 2
done
