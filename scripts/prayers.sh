#!/usr/bin/env bash

#############################################
#
# Shows the prayers times of the current day.
# Leverages the API of aladhan.com.
#
#############################################

# Might have a trailing zero
TMP_CURRENT_DAY=$(date '+%W')

# Puts into arithmetic context of base 10,
# which leads to the removal of the trailing 0.
CURRENT_DAY=$((10#$TMP_CURRENT_DAY))

# Grabs the prayer times for the whole month and
# filters it by the current day. Additionaly it trims
# ugly JSON symbols.
curl 'http://api.aladhan.com/v1/calendarByCity?city=Berlin&country=DE&method=3&month=03&year=2018' 2>/dev/null \
    | jq ".data[$CURRENT_DAY].timings" \
    | sed -e 's/{//g' -e 's/"//g' -e 's/}//g' -e 's/,//g'

