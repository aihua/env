#!/bin/sh

#route del -net 192.168.1.0 gw 0.0.0.0 netmask 255.255.255.0 dev eth0
#route del -net 0.0.0.0 gw 192.168.1.1 netmask 0.0.0.0 dev eth0

#ifconfig wlan0:0 192.168.10.11 netmask 255.255.255.0
ip route del default via 192.168.1.1 dev eth0
ip route del 192.168.1.0/24 dev eth0
#ip route del 192.168.10.0/24 dev eth0
#ip route del 192.168.10.0/24 dev eth0  proto kernel  scope link  src 192.168.10.10
#ip route replace default via 192.168.1.1 dev wlan0  proto static 
#ip route replace 192.168.1.0/24 dev wlan0  proto kernel  scope link 
