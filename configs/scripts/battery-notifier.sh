low=20
hight=80
time=60

path_to_capacity="/sys/class/power_supply/BAT0/capacity"
path_to_status="/sys/class/power_supply/BAT0/status"

while [ 1 ]
do
    percent_bat=$(cat $path_to_capacity)
    status=$(cat $path_to_status)

    if [[ "$status" == "Discharging" && ( $percent_bat -le $low ) ]]
    then
        notify-send "Battery is low"
    fi

    if [[ "$status" == "Charging" && ( $percent_bat -ge $hight ) ]]
    then
        notify-send "Battery is end charge"
    fi

    sleep $time
done
