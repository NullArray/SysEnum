#!/bin/bash

VAR=$1
VAR2=$2

# If no args, simple usage will be printed.
if [ "$VAR" == ""  ]
then
	echo ""
	echo "This script prints system information to the terminal if -print argument is specified.
	
To dump output to a text file instead specify -dump argument and path e.g. sysinfo.sh -dump /tmp/output.txt"

# If -print arg has been passed we print sysinfo to STDOUT.
else
	if [ "$VAR" == "-print"  ]
	then
		echo "" 
		echo "Current user is : "
		`printf "\n %s %s" whoami`
		echo ""
		echo "Current user ID is : "
		`printf "\n %s %s" id bin`
		echo "" 
		echo "User login history is : "
		`printf "\n %s %s" last`
		echo "" 
		echo "Current system is : "
		`printf "\n %s %s" uname -a`
		echo ""
		echo "Current running processes are : "	
		`printf "\n %s %s" ps -e`
		echo ""
		echo "Current IP configuration is : "
		`printf "\n %s %s" ifconfig`
		echo ""
		echo "Current connected devices are : "
		`printf "\n %s %s" arp -a`
	
	echo ""
	echo "Done."
	exit 1
	# We check if -dump and path have been specified and if so we dump sysinfo to output file
	else
		if [ "$VAR" == "-dump"  ] 
		then
			if [ "$VAR2" == ""  ]
			then
				echo "No path specified"
				exit 2
			# Proper arguments are passed, print info to file, at path specified in $VAR2	
			else
				echo "Current user is : " >> $VAR2
				`printf "\n %s %s" whoami` >> $VAR2
				echo "" >> $VAR2
				echo "Current user ID is : " >> $VAR2
				`printf "\n %s %s" id bin ` >> $VAR2
				echo "" >> $VAR2
				echo "User login history is : " >> $VAR2
				`printf "\n %s %s" last ` >> $VAR2
				echo "" >> $VAR2
				echo "Current system is : " >> $VAR2
				`printf "\n %s %s" uname -a` >> $VAR2
				echo "" >> $VAR2
				echo "Current running processes are : " >> $VAR2 
				`printf "\n %s %s" ps -e` >> $VAR2
				echo "" >> $VAR2
				echo "Current IP configuration is : " >> $VAR2
				`printf "\n %s %s" ifconfig` >> $VAR2
				echo "" >> $VAR2
				echo "Current connected devices are : " >> $VAR2
				`printf "\n %s %s" arp -a` >> $VAR2
				echo "Output dumped to $2"
	    	fi	
			exit 4
		else
			echo "Invalid argument specified"
			exit 3
		fi
	fi
fi
exit 5





