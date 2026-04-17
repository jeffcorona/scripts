#!/bin/zsh

#debugging
set -euo pipefail

#function
check_connection() {
    local endpoint=$1
    local loss=$(ping -t 5 "$endpoint" | tail -n 2  |  awk '{gsub("%","",$7); print $7}')

    if [[ $loss -eq 0 ]]; then
        echo "$endpoint is up and running"
    elif [[ $loss -ge 50 && $loss -le 75 ]]; then
        echo "$endpoint is having some connection issues"
    else
        echo "$endpoint is down"
    fi
}

screen_space() {
    echo
    echo
}

##check term servers
echo "Checking connection to term servers"
term_servers=("192.168.10.17" "192.168.10.38" "192.168.10.73" "192.168.10.75" "192.168.10.76" "192.168.10.78")

for server in "${term_servers[@]}"; do
    check_connection "$server"
done

##creates a space in between checks
screen_space

##check gateway
echo "Checking gateway connection"
gateway=("gateway.avantiwindow.com")
check_connection "$gateway"

screen_space

#check all printers at El Mirage
echo "Checking printers"
printers=("192.168.34.139" "192.168.34.170" "192.168.34.29" "192.168.34.50" "192.168.34.55" "192.168.34.93" "192.168.35.22" "192.168.35.223" "192.168.35.240" "192.168.35.30" "192.168.35.30" "192.168.35.31" "192.168.35.46")
for printer in "${printers[@]}"; do
    check_connection "$printer"
done