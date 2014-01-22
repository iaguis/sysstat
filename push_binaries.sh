#!/bin/sh
EXECUTABLES="sa1 sa2 sar sysstat sadf sadc pidstat nfsiostat mpstat iconfig cifsiostat"

if [ $# -eq 0 ]
then
    echo "Use: $0 DEVICE_SERIAL_NUMBER"
    exit 0
fi

SERIAL_NUMBER=$1

adb -s $SERIAL_NUMBER shell mkdir -p /data/bin
for f in $EXECUTABLES
do
    adb -s $SERIAL_NUMBER push $f /data/bin
done
