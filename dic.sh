#!/bin/bash


checkInternet()
{
	echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1 # query google with a get request
	if [ $? -eq 0 ]; then #check if the output is 0, if so no errors have occured and we have connected to google successfully
		 echo "Working..."
	else
		echo "Error: no active internet connection" >&2 #sent to stderr
		return 1
	fi
}

checkInternet || exit 1

