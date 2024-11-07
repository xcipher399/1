#!/bin/bash

# Script to reset iptables rules and accept all traffic

echo "Flushing all iptables rules..."
iptables -F
iptables -t nat -F
iptables -t mangle -F
iptables -t raw -F

echo "Deleting all user-defined chains..."
iptables -X
iptables -t nat -X
iptables -t mangle -X
iptables -t raw -X

echo "Setting default policies to ACCEPT..."
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

echo "Saving iptables rules to be persistent on reboot..."
iptables-save > /etc/iptables/rules.v4

echo "iptables has been reset and all traffic is now accepted."
