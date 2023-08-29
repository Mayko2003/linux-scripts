#!/bin/bash

function ctrl_c(){
  echo -e "\nStopping..."
  exit 1
}
#crtl+c key
trap ctrl_c INT

ip=$1
for port in $seq(1 to 65335); do
  timeout 1 bash -c "echo '' > /dev/tcp/$ip/$port" 2>/dev/null && echo "[+] Port: $port - Open"
done; wait
