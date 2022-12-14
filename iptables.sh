#!/bin/bash

# Accept input for docker-proxy
iptables -A INPUT -i tun+ -p tcp -m tcp --dport 8080 -j ACCEPT

# Accept forward to nat interface
iptables -A FORWARD -s 192.168.221.0/28 -o eth0 -j ACCEPT

# Accept traffic in bridge
iptables -A FORWARD -s 192.168.221.0/28 -d 192.168.221.0/28 -j ACCEPT

# Accept established/related incoming traffic
iptables -A FORWARD -d 192.168.221.0/28 -i eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT

# Nat on eth0 interface
iptables -t nat -A POSTROUTING -s 192.168.221.0/28 -o eth0 -j MASQUERADE