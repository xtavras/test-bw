#!/bin/bash
#
# Script to test the speed of our ISP.
# 
# Conversion to Mbps taken from:
#  http://www.fir3net.com/General-UNIX/test-bandwith-on-linux.html
#

UBUNTUVER="13.04"
PARAMETER="--progress-bar"

if [ "$1" == "silent" ]; then
	PARAMETER="--silent"
else
	echo 'To run silently, use parameter "silent".'
fi

echo "Speed downloading from WiredTree"
echo "scale=2; `curl $PARAMETER -w "%{speed_download}" -o /dev/null http://speedtest.wiredtree.com/10mb.bin` / 131072" | bc | xargs -I {} echo {}Mb\/s
echo ""
echo "--------------------------------------------------"
echo ""
echo "Speed downloading Ubuntu ISO from PREGINET"
echo "scale=2; `curl $PARAMETER -w "%{speed_download}" -o /dev/null -r 0-10485760 http://mirror.pregi.net/pub/Linux/ubuntu-iso/$UBUNTUVER/ubuntu-$UBUNTUVER-desktop-amd64.iso` / 131072" | bc | xargs -I {} echo {}Mb\/s
echo ""
echo "--------------------------------------------------"
echo ""
echo "Speed downloading random2500x2500.jpg from Eastern Telecom"
echo "scale=2; `curl $PARAMETER -w "%{speed_download}" -o /dev/null http://speedtest.eastern-tele.com/mini/speedtest/random2500x2500.jpg` / 131072" | bc | xargs -I {} echo {}Mb\/s
echo ""
echo "--------------------------------------------------"
echo ""
echo "Speed downloading random2500x2500.jpg from PLDT"
echo "scale=2; `curl $PARAMETER -w "%{speed_download}" -o /dev/null http://210.213.242.46/speedtest/speedtest/random2500x2500.jpg` / 131072" | bc | xargs -I {} echo {}Mb\/s
echo ""
echo "--------------------------------------------------"
echo ""
echo "Speed downloading random2500x2500.jpg from Globe Telecom"
echo "scale=2; `curl $PARAMETER -w "%{speed_download}" -o /dev/null http://speedtest.globe.com.ph/speedtest/random2500x2500.jpg` / 131072" | bc | xargs -I {} echo {}Mb\/s
echo ""
echo "--------------------------------------------------"
echo ""
echo "Speed downloading random2500x2500.jpg from wi-tribe"
echo "scale=2; `curl $PARAMETER -w "%{speed_download}" -o /dev/null http://www.wi-tribe.ph/speedtest/random2500x2500.jpg` / 131072" | bc | xargs -I {} echo {}Mb\/s
echo ""
echo "--------------------------------------------------"
echo ""
echo "Speed downloading test10.zip from SoftLayer"
echo "scale=2; `curl $PARAMETER -w "%{speed_download}" -o /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip` / 131072" | bc | xargs -I {} echo {}Mb\/s
echo ""
echo "fin."
