#!/usr/bin/env bash
set -e
source .env
CONF="$HOME/.wxconf" 
ADDR="$1"

if [ ! -f "$CONF" ]; then
    echo -e "\n[------------WELCOME to the WEATHER APP -------------]"
    echo -e   "[--------------------{by-TM}-------------------------]\n"

    read -p "What is your name? " USR_NAME
    echo "USR_NAME= $USR_NAME" > "$CONF"
    read -p "What's the name of your city? " USR_CITY
    echo "USR_CITY= $USR_CITY" >> "$CONF"
else
    USR_NAME=$(awk 'NR==1 {print $2}' $CONF)
    USR_CITY=$(awk 'NR==2 {print $2}' $CONF) 
fi

if [[ "$ADDR" != "" ]]; then
    USR_CITY=$ADDR
fi

LOCATION=$(curl -f -s  "https://maps.googleapis.com/maps/api/geocode/json?address="$USR_CITY"&key="$G_KEY)

LATITUDE=$(echo $LOCATION | jq .results[0].geometry.location.lat)
LONGITUDE=$(echo $LOCATION | jq .results[0].geometry.location.lng)

WX_DATA=$(curl -f -s "https://api.tomorrow.io/v4/weather/forecast?location="$LATITUDE","$LONGITUDE"&apikey="$W_KEY)
T_VAL=$(echo $WX_DATA | jq '.timelines.daily[0].time , .timelines.daily[0].values.temperatureMax , .timelines.daily[0].values.temperatureMin , .timelines.daily[0].values.temperatureAvg , .timelines.daily[0].values.humidityAvg , .timelines.daily[0].values.precipitationProbabilityAvg ')

#awk '{print}' <(echo "$T_VAL")   Time-Maxtemp-Mintemp-Avgtemp-HumAvg-Rain%

FMT_TIME=$(date -d $((awk 'NR==1 {print}' <(echo "$T_VAL")) | tr -d '"') +"%Y-%m-%d %H:%M:%S UTC")


echo -e "\n🌤️  Hello, $USR_NAME! Here's your weather update for today: $FMT_TIME🌤️\n"
echo -e "----------------------------------------------"
echo -e "🌡️  Average Temperature      :   "$(awk 'NR==4 {print}' <(echo "$T_VAL")) 
echo -e "🌞  Max Temperature         :   "$(awk 'NR==2 {print}' <(echo "$T_VAL")) 
echo -e "❄️  Min Temperature          :   "$(awk 'NR==3 {print}' <(echo "$T_VAL")) 
echo -e "💧  Average Humidity        :   "$(awk 'NR==5 {print}' <(echo "$T_VAL")) 
echo -e "☔  Avg Precipitation %     :   "$(awk 'NR==6 {print}' <(echo "$T_VAL")) 
echo -e "----------------------------------------------\n"
