#!/bin/sh

# start cron
printenv | awk '{print "export " $1}' > /root/env.sh
/usr/sbin/crond -n