#!/bin/bash
battery () {
    bat_perc=$(acpi -b | sed 's/,/ /g' | awk '{print$4}')
    bat_num=$(echo $bat_perc | sed 's/%/ /')
    bat_charge=$(acpi -b | sed 's/,//g' | awk '{print$3}')
    if [ "$bat_charge" == "Discharging" ];then
        bat_c_sym=$(echo "")
    else 
        bat_c_sym=$(echo '\x05\uE041')
    fi
    if [ $bat_num -gt 75 ]; then
        bat_sym=$(echo '\x04\uE033')
    elif [ $bat_num -gt 50 ]; then
        bat_sym=$(echo '\x04\uE032')
    elif [ $bat_num -gt 25 ]; then
        bat_sym=$(echo '\x05\uE031')
    else 
        bat_sym=$(echo '\x03\uE030')
    fi
    echo -e "$bat_c_sym$bat_sym:$bat_perc\x02"
}
mem () {
    me=$(free -m | awk '/^-/ {print$3}')
    echo -e "\x08\uE021:$me\x01"
}
cpu () {
    read cpu a b c previdle rest < /proc/stat
    prevtotal=$((a+b+c+previdle))
    sleep 0.5
    read cpu a b c idle rest < /proc/stat
    total=$((a+b+c+idle))
    cpu=$((100*( (total-prevtotal) - (idle-previdle) )/ (total-prevtotal) ))
    echo -e "\x09\uE026:$cpu%\x01"
}
vol () {
    volume=$(amixer get PCM | egrep -o -m1 "[0-9]+%")
    volume_val=$(echo $volume | sed 's/%//')
    mute_stat=$(amixer get Master | egrep -o "[+[a-z]+]")

    if [ "$mute_stat" == "[off]" ];then
        vol_sym=$(echo '\uE052')
    else
        if [ $volume_val -gt 66 ]; then
            vol_sym=$(echo '\uE152')
        elif [ $volume_val -gt 33 ]; then
            vol_sym=$(echo '\uE053')
        else 
            vol_sym=$(echo '\uE051')
        fi
    fi
    echo -e "\x06$vol_sym:$volume\x01"
}
while true; do
    xsetroot -name "$(echo -e "\x06\uE066"):${speed_kbs_trans}kb/s $(echo -e "\x07\uE067"):${speed_kbs}kb/s $(cpu) $(mem) $(vol) $(battery)  $(date +"%d-%m-%y %R")"

    #network upload speed
    new_bytes=$(cat /sys/class/net/wlp3s0/statistics/rx_bytes)
    let speed=($new_bytes-$old_bytes)/3
    let speed_kbs=$speed/1024
    old_bytes=$new_bytes

    new_bytes_trans=$(cat /sys/class/net/wlp3s0/statistics/tx_bytes)
    let speed_trans=($new_bytes_trans-$old_bytes_trans)/3
    let speed_kbs_trans=$speed_trans/1024
    old_bytes_trans=$new_bytes_trans
    sleep 3s
done
