#!/bin/bash -eu

target_chain_http=`iptables -t nat -L -n | grep .*4949.*redir.*ports.*9990.*`;
[ -z "target_chain_http" ] && /sbin/iptables -t nat -I PREROUTING -p tcp -m tcp --dport 4949 -j REDIRECT --to-ports 9990;
target_chain_https=`iptables -t nat -L -n | grep .*4848.*redir.*ports.*9993.*`;
[ -z "target_chain_https" ] && /sbin/iptables -t nat -I PREROUTING -p tcp -m tcp --dport 4848 -j REDIRECT --to-ports 9993;
