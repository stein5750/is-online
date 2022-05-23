#!/bin/bash
# Just an alternative to ping -c 1 $url
#
# @param: url
# @return: true|false True if there is an response. Else false.

# Variables
URL=$1
REGEX='^(https?://|www\.|localhost)[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*$'

# A simple check to see if the argument is an url.
if ! [[ $URL =~ $REGEX ]]; then
	echo "The argument must be an url"
	exit 1;
fi

# Connect to the url and evaluate the response
wget -q --tries=10 --timeout=20 --spider "$URL"
if [[ $? -eq 0 ]]; then
        echo "true"
else
        echo "false"
fi
