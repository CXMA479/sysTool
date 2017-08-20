#!/bin/sh

# kee the drcom online...
#Aug 1, 2017

test_site=cn.bing.com
check_frequency=30m #10s #5m
while true
do
    unreachable=` ping -c 3 -w 10 $test_site | grep '0 received' | wc -l`
    if test $unreachable -gt 0 # networks has been halted, need to re-lanch the drcom
    then
        echo $test_site is unreachable, re-launch the Dr.com
        pkill -x drcomauthsvr
        pkill -x dr   # this is more effecient
        sleep 5s
        dr &
#    else
#        echo 'networks is reachable!'
    fi
sleep $check_frequency
done
