#!/bin/bash

  if ifconfig | grep -q 10.68.9.1; then
    echo "OK"
  else
    /etc/init.d/hostapd restart
    sleep 10
    ifconfig wlan0 10.68.9.1 netmask 255.255.255.0
    sleep 2
    /etc/init.d/udhcpd restart
  fi
