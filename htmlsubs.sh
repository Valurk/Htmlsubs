#!/bin/bash

	if [ "$1" == "" ]
then echo -e "
██╗  ██╗████████╗███╗   ███╗██╗     ███████╗██╗   ██╗██████╗ ███████╗
██║  ██║╚══██╔══╝████╗ ████║██║     ██╔════╝██║   ██║██╔══██╗██╔════╝
███████║   ██║   ██╔████╔██║██║     ███████╗██║   ██║██████╔╝███████╗
██╔══██║   ██║   ██║╚██╔╝██║██║     ╚════██║██║   ██║██╔══██╗╚════██║
██║  ██║   ██║   ██║ ╚═╝ ██║███████╗███████║╚██████╔╝██████╔╝███████║
╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚══════╝
"
	echo "usage: $0 https://google.com"
	
else

	 echo ">>>>>searching for subdomains!<<<<<"
	 sleep 3
	 
	 wget $1 > /dev/null 2>&1
	 
	 clear
	 
	 grep href index.html | cut -d  "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" > result
	 
	 	  	 
	 	 	 	 
	 for url in $(cat result); do host $url | grep "has address"; done
	 
	 rm index.html
	 
		 
	 #sort result | uniq #formatting the file
	 #cat result	 
	 
fi

