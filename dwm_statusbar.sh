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
        bat_sym=$(echo '\uE033')
    elif [ $bat_num -gt 50 ]; then
        bat_sym=$(echo '\uE032')
    elif [ $bat_num -gt 25 ]; then
        bat_sym=$(echo '\uE031')
    else 
        bat_sym=$(echo '\uE030')
    fi
    echo -e "$bat_c_sym$bat_sym:$bat_perc"
}
mem () {
    me=$(free -m | awk '/^-/ {print$3}')
    echo -e "Mem:$me"
}
cpu () {
    cpu=$(ps aux | awk {'sum+=$3;print sum'} | tail -n1)
    echo -e "Cpu:$cpu%"
}
xsetroot -name "$(cpu) $(mem) $(battery) $(date +"%d-%m-%y %R") "
