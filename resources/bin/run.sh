#!/bin/sh

# 1 - log file to write output
# 2 - executable
# 3 - args

i=0
until [ ${!i} == '--options-file' ];
do
   let i=$i+1
done
let i=$i+1
ip=`cat ${!i} | grep 'listen_address' | cut -f2 -d' '`
# FIXME workaround for log message
echo "Starting listening for CQL clients" >> $1
echo "end facked message" >> $1
exec "$2" "${@:3}" <&- 2>&1 | tee -a "$1" &
sleep 2

sleep 8
