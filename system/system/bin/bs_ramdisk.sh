#! /system/bin/sh

# local key_word=`getprop sys.init.ramdisk.lsof`
# /system/bin/lsof | grep "${key_word}" > /data/ram_f2fs/log

if [ "read" == $1 ] ; then
    local read_delay=`getprop sys.init.ramdisk.delay.read`
    echo ${read_delay} > /sys/module/brd/parameters/rd_read
fi

if [ "write" == $1 ] ; then
    local write_delay=`getprop sys.init.ramdisk.delay.write`
    echo ${write_delay} > /sys/module/brd/parameters/rd_write
fi
