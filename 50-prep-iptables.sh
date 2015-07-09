#!/bin/sh
iptables -I INPUT -s 172.16.0.0/12 ! -i snow0 -j DROP  
iptables -I INPUT -s 172.16.0.1 -i lo -j ACCEPT  
iptables-save > /etc/iptables/rules.v4
