#!/bin/sh

clear

echo -e "\n =========================================="
echo -e ""    Script for regulate monitor brightness
echo -e ""      	Based on xrandr command
echo -e " ==========================================\n"

MIN_BRIGHTNESS="0.1"
MAX_BRIGHTNESS="3"

monitors=($(xrandr | awk '/ connected / {print $1}'))

AMOUNT_MONITORS=${#monitors[@]}

echo -e " Monitor connected:"
for ((monitor=0; monitor<AMOUNT_MONITORS; monitor++)); do
    echo " Monitor $((monitor+1)) --> ${monitors[$monitor]}"
done
echo ""

while true; do
	read -p " Choose connected monitors: " MONITOR_CHOCE
	read -p " Insert a value to $MIN_BRIGHTNESS (min) at $MAX_BRIGHTNESS (max): " BRING
	MONITOR_CHOCE_ON_ARRAY=$(($MONITOR_CHOCE - 1))
	INTEGER_BRING=$(echo "$BRING * 10" | bc)
	if (( MONITOR_CHOCE_ON_ARRAY <= AMOUNT_MONITORS && MONITOR_CHOCE_ON_ARRAY >= 0 )); then
		#if (( $(echo "$brightness_value >= $MIN_BRIGHTNESS" | bc -l) && $(echo "$brightness_value <= $MAX_BRIGHTNESS" | bc -l) )); then
		if (("$INTEGER_BRING" -le "$MAX_BRIGHTNESS") && ("$INTEGER_BRING" -gt 0 )); then
			xrandr --output ${monitors[$MONITOR_CHOCE_ON_ARRAY]} --brightness "$BRING"
			echo -e "\n Brightness monitor regulated!"
			exit 0
		else
			echo " Brightness value is not correct, retry"
		fi
	else
		echo " Number monitor $MONITOR_CHOCE is not valid, retry"
	fi
done
