#!/bin/bash
#title           : OWA_version_checker.sh
#description     : This script will help you to retrieve OWA version for exposed interface
#author		     : CERT Santé
#date            : 01/03/2023
#version         : 1.0    
#usage		     : OWA_version_checker.sh
#notes           : Before use, make the script executable with chmod +x ./OWA_version_checker.sh

RED='\033[0;31m' #Red
GREEN='\033[0;32m' #Green
NC='\033[0m' # No Color

# Function to display usage
usage() {
    echo -e "Usage: $0, \nThen enter the URL when asked, example : https://owa.example.com/"
    exit 1
}

# Prompt asking to Enter the targeted URL
read -p "Please enter the Exchange OWA URL: " URL

# Check if URL is provided (doesn't check if well formatted, only if the field is not empty)
if [ -z "$URL" ]; then
    echo  -e "${RED}No URL provided ! ${NC}"
    usage
fi

# Fetch the OWA login page and extract the version headers
VERSION_HEADERS=$(curl -kv -L --stderr - "$URL" | grep -i 'X-OWA-Version')

# Check if the curl command was successful
if [ $? -ne 0 ]; then
    echo -e "${RED}Failed to retrieve the page. Please check the URL and try again."
    exit 1
fi

# Check if any version headers were found, return if found.
if [ -n "$VERSION_HEADERS" ]; then
    echo -e "\n${GREEN}Exchange OWA Version Headers:"
    echo -e "${NC}$VERSION_HEADERS\n"
else
    echo -e "${RED}Could not determine the Exchange OWA version. It may not be exposed in the headers."
fi
