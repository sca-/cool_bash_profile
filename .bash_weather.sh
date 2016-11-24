#!/bin/b

dlWeather (){
	local URL="http://api.openweathermap.org/data/2.5/weather?q=Moscow,ru&appid=7eed88250f409f8e0c3320ce28689171&units=metric&mode=json"
	local RESPONSEHOLDER=$(curl -s $URL)
	local TEMP=$(echo "$RESPONSEHOLDER" | grep -o -e '"temp":[-0-9.]*' | cut -d ':' -f2)
	local WEATHERCODE=$(echo "$RESPONSEHOLDER" | grep -o -e '"main":"[a-zA-Z]*' | cut -d '"' -f4)
	echo "$TEMP""º $WEATHERCODE"
}

getWeather (){
	local u=600
	local NOW=$(date +%s)
	CONFIGFILE=/Users/semenov/.LAST_TIME_CHECKED_WEATHER.vars

	if [ -r ${CONFIGFILE} ]; then
	  # Read the configfile if it's existing and readable
	  source ${CONFIGFILE}
	fi
#	if [ -z "$LAST_TIME_CHECKED_WEATHER" ] || [ "$LAST_TIME_CHECKED_WEATHER" -lt $((NOW - u)) ] ; then
	echo -n ""> ${CONFIGFILE}
#	wget -q --spider http://google.com
#	if [ $? -eq 0 ]; then
		WEATHERCHAR=$(dlWeather)
		echo WEATHERCHAR="\"$WEATHERCHAR\"">> ${CONFIGFILE}
#	else
#		echo WEATHERCHAR='---'>> ${CONFIGFILE}
#	fi
#		echo LAST_TIME_CHECKED_WEATHER=$NOW>> ${CONFIGFILE}
#	fi
#	echo "$WEATHERCHAR"
}

getWeather

