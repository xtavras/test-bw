#!/bin/bash
#
# Script to test the speed of our ISP.
#
# Conversion to Mbps taken from:
#  http://www.fir3net.com/General-UNIX/test-bandwith-on-linux.html
#

declare -a labels=(
	"BayanTel - Quezon City"
	"Eastern Telecom - Makati City"
	"Globe Telecom - Makati City"
	"PLDT - Makati City"
	"wi-tribe - Makati City"
	"WiredTree - Chicago"
	"SoftLayer - Washington DC"
	)

declare -a urls=(
	"http://vega.skyinet.net/speedtest/random2500x2500.jpg"
	"http://speedtest.eastern-tele.com/mini/speedtest/random2500x2500.jpg"
	"http://speedtest.globe.com.ph/speedtest/random2500x2500.jpg"
	"http://210.213.242.46/speedtest/speedtest/random2500x2500.jpg"
	"http://www.wi-tribe.ph/speedtest/random2500x2500.jpg"
	"http://speedtest.wiredtree.com/10mb.bin"
	"http://speedtest.wdc01.softlayer.com/downloads/test10.zip"
	)

# ---------- DO NOT CHANGE ANYTHING BELOW ----------

PARAMETER="--progress-bar"

if [ "$1" == "silent" ]; then
	PARAMETER="--silent"
else
	echo 'To run silently, use parameter "silent".'
fi

for (( i=0; i<${#labels[@]}; i++ )); do
	echo "Speedtest from: ${labels[$i]}"
	echo "scale=2; `curl $PARAMETER -w "%{speed_download}" -o /dev/null ${urls[$i]}` / 131072" | bc | xargs -I {} echo {}Mb\/s
	echo ""
	echo "--------------------------------------------------"
	echo ""
done

UBUNTUVER="13.04"

# Special case: download Ubuntu ISO within a certain range only.
echo "Speedtest from: Ubuntu ISO from PREGINET"
echo "scale=2; `curl $PARAMETER -w "%{speed_download}" -o /dev/null -r 0-10485760 http://mirror.pregi.net/pub/Linux/ubuntu-iso/$UBUNTUVER/ubuntu-$UBUNTUVER-desktop-amd64.iso` / 131072" | bc | xargs -I {} echo {}Mb\/s
echo ""

echo "fin."
