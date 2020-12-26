#! /bin/bash

set -e

echo -e "\e[1;31m
██╗    ██╗ █████╗ ██╗   ██╗██████╗  █████╗  ██████╗██╗  ██╗      ███████╗███████╗
██║    ██║██╔══██╗╚██╗ ██╔╝██╔══██╗██╔══██╗██╔════╝██║ ██╔╝      ██╔════╝██╔════╝
██║ █╗ ██║███████║ ╚████╔╝ ██████╔╝███████║██║     █████╔╝ █████╗███████╗███████╗
██║███╗██║██╔══██║  ╚██╔╝  ██╔══██╗██╔══██║██║     ██╔═██╗ ╚════╝╚════██║╚════██║
╚███╔███╔╝██║  ██║   ██║   ██████╔╝██║  ██║╚██████╗██║  ██╗      ███████║███████║
 ╚══╝╚══╝ ╚═╝  ╚═╝   ╚═╝   ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝      ╚══════╝╚══════╝
            by: Nighthack01                                                       \e[0m "


echo -e "\n\n"

echo -e "\e[1;34mCreating Directory for $1 *** \e[0m"

mkdir $1
cd $1
echo -e "\e[1;34m\nFinding wayback URLS for $1 *** \n \e[0m"

echo "$1" | waybackurls | egrep -v '(.css|.png|.jpeg|.jpg|.svg|.gif|.wolf|.woff|.eot|.ico)' | tee $1.txt

echo -e "\e[1;31m\nFinding valid URLs for from wayback machine \n \e[0m"

cat $1.txt | waybackurls -get-versions  | tee $1with_wayback_urls.txt

sort $1with_wayback_urls.txt | uniq | tee $1sort_with_wayback_urls.txt

echo -e "\e[1;31m\nTaking Screenshort using aquatone \n \e[0m"

cat  $1sort_with_wayback_urls.txt | aquatone 


