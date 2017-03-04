#!/bin/bash
if ping -c 1 -W 2 $1 > /dev/null; then
echo "\${color #80FFF9}Up"
else
echo "\${color #DC143C}Down"
fi
