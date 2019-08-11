#!/bin/bash

# describe.sh - query word definitions from oxford dictionaries api

# Copyright (c) 2019, Taieb
# All rights reserved.


grn='\e[1;32m'
cyan='\e[0;36m'
lcyan='\e[1;36m'
lblue='\e[1;34m'
pink='\e[35;1m'
base_url="http://www.merriam-webster.com/dictionary/"
checkInternet()
{
    echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1 # query google with a get request
    if [ $? -eq 0 ]; then
        echo "Working..."
    else
        echo "Error: no active internet connection" >&2
        return 1
    fi
}

checkInternet || exit 1

enterWord()
{
    
    read -p 'enter the word: ' word
    echo $word
	result=$(curl -sX GET --header "Accept: application/json" "https://www.yourdictionary.com/$word") > /dev/null 2>&1 #fetch results for input word
	echo $result
	dst=$(echo -n "$result" | sed -r "s/.*dst\" *: *\"([^\"]*).*/\1/g")
    echo -e "$dst"
    
}


enterWord
