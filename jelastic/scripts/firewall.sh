#!/bin/bash -eu

grep -q '4949.*REDIRECT.*ports.*9990' /etc/sysconfig/iptables && return 0;
/sbin/iptables -t nat -I PREROUTING -p tcp -m tcp --dport 4949 -j REDIRECT --to-ports 9990;
grep -q '4848.*REDIRECT.*ports.*9993' /etc/sysconfig/iptables && return 0;
/sbin/iptables -t nat -I PREROUTING -p tcp -m tcp --dport 4949 -j REDIRECT --to-ports 9990;
