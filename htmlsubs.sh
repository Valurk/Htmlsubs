#!/bin/bash

if [ "$1" == "" ]
then echo -e " \e[32m
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
    
    echo -e "\e[31;1m >>>>> searching for subdomains! <<<<<"
    
    for url in $(cat result); do host $url | grep "has address" ; done >results
    
    clear
    
    sed -i 's/has address/>>>>>>>>>>/g' results
    
    echo -e "\e[31;1m                ▼▼▼▼▼▼ RESULTS ▼▼▼▼▼▼"
    echo ''
    
    sort results | uniq #formatting the file
    
    
    rm index.html
    rm result
    
fi
