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
	 	 	 
	 wget $1 > /dev/null 2>&1
	 
	 		 
	 grep href index.html | cut -d  "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" > result
	 
	 echo ">>>>> searching for subdomains! <<<<<"
	 	 	 	 
	 for url in $(cat result); do host $url | grep "has address" ; done >result2
	 
	 clear
	 
	 sed -i 's/has address/>>>>>>>>>>/g' result2
	 
	 echo "                 ▼▼▼▼▼▼ RESULTS ▼▼▼▼▼▼"
	 echo '' 
	 cat result2

	 	 
	 rm index.html
	 	 
	 #sort result | uniq #formatting the file
	 #cat result
	 	 
fi
