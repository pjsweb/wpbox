#!/bin/bash

display_usage() { 
	echo -e "\nThis script should have three arguments:" 
	echo -e "\nUsage:\n gitcreate [github username] [github repository] [repository description] \n" 
	} 

# if less than three arguments supplied, display usage 
	if [  $# -le 2 ] 
	then 
		display_usage
		exit 1
	fi 
 
# check whether user had supplied -h or --help . If yes display usage 
	if [[ ( $# == "--help") ||  $# == "-h" ]] 
	then 
		display_usage
		exit 0
	fi 
 
# # display usage if the script is not run as root user 
# 	if [[ $USER != "root" ]]; then 
# 		echo "This script must be run as root!" 
# 		exit 1
# 	fi 
 
echo "All good !!!"



curl -u $1 https://api.github.com/user/repos -d "{\"name\": \"$2\", \"description\": \"$3\"}"

#echo "# $3" >> README.md
git init
git add *
git commit -m "First commit"
git remote add origin "https://github.com/$1/$2.git"
git push -u origin master