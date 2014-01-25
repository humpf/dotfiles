battery () {
    bat_perc=$(acpi -b | sed 's/,/ /g' | awk '{print$4}')
    bat_num=$(echo $bat_perc | sed 's/%/ /')
    bat_charge=$(acpi -b | sed 's/,//g' | awk '{print$3}')
    if [ "$bat_charge" == "Discharging" ];then
        bat_c_sym=$(echo "")
    else 
        bat_c_sym=$(echo '\uE041')
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
    echo -e "\x08Mem:$me\x01"
}
cpu () {
    cpu=$(ps aux | awk {'sum+=$3;print sum'} | tail -n1)
    echo -e "\x09Cpu:$cpu%\x01"
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
xsetroot -name "$(cpu) $(mem) $(vol) $(battery) $(date +"%d-%m-%y %R")"
