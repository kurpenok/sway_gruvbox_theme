low=20
hight=80
time=30

path_to_capacity="/sys/class/power_supply/BAT0/capacity"
path_to_status="/sys/class/power_supply/BAT0/status"

send_msg () {
    notify-send "$1, now battery have $2"
}

while [ 1 ]
do
    percent_bat=$(cat $path_to_capacity)
    status=$(cat $path_to_status)

    if [[ "$status" == "Discharging" && ( $percent_bat < $low ) ]]
    then
        send_msg "The battery is low" $percent_bat
    fi

    if [[ "$status" = "Charging" && ( $percent_bat > $hight ) ]]
    then
        send_msg "The battery is charged" $percent_bat
    fi

    sleep $time
done
