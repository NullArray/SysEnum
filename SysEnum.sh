#!/bin/bash

function main()
{	printf "\nThis script enumerates system information and appends it to a textfile.\n"
	printf "\nThese items will be enumerated: 
	
1. User IDs and login history.
2. OS details and mounted disks.
3. Network status and information.
4. Running processes.\n\n"
    
    read -p 'Continue? Y/n : ' choice2
    if [[ $choice2 == 'y' ]]; then
		enum
	else
		echo "Aborted"
		exit 1
	fi
}


function enum()
{	printf "\n\nPlease provide a path to which the output will be saved. I.e /tmp/output.txt\n"
	read -p 'Path? : ' outfile
		
	echo "+-+-+-+-+" | tee -a $outfile 1>&2
	echo "|L|O|G|S|" | tee -a $outfile 1>&2
	echo "+-+-+-+-+" | tee -a $outfile 1>&2
		
	printf "\n\nUser IDs\n" | tee -a $outfile 1>&2
	whoami | tee -a $outfile 1>&2
	printf "\n\n" | tee -a $outfile 1>&2	
	id | tee -a $outfile 1>&2
	printf "\n\n" | tee -a $outfile 1>&2
	last | tee -a $outfile 1>&2
	sleep 0.5 && clear
		
	printf "\n\nOS details and mounted disks\n\n" | tee -a $outfile 1>&2
		
	uname -a | tee -a $outfile 1>&2
	printf "\n\n" | tee -a $outfile 1>&2
	df -h | tee -a $outfile 1>&2
	printf "\n\n Installed kernels\n" | tee -a $outfile 1>&2
	dpkg -l linux-image-\* | grep ^ii | tee -a $outfile 1>&2
        sleep 0.5 && clear
		
	printf "\n\nNetwork status & info\n\n" | tee -a $outfile 1>&2
		
	ifconfig -a | tee -a $outfile 1>&2
	printf "\n\n" | tee -a $outfile 1>&2
	arp -e | tee -a $outfile 1>&2
	printf "\n\n" | tee -a $outfile 1>&2
	netstat -atp | tee -a $outfile 1>&2
	sleep 0.5 && clear
		
	printf "\n\nProcess info\n\n" | tee -a $outfile 1>&2
		
	ps -d -f | tee -a $outfile 1>&2
	sleep 0.5 && clear
		
	echo "Done, output saved to $outfile"
	exit 1
}		
		

if [[ "$EUID" -ne 0 ]]; then
   echo "It is recommended that this script is run as root"
   printf "\nRunning it without super user privilege may affect the results\n"
   
   read -p 'Continue without root? Y/n : ' choice1
   if [[ $choice1 == 'y' ]]; then
       main
   else
       echo "Aborted"
       exit 1
   fi
else
	main
fi


	
