umask 022

LOGDIR=/data/local/log
LOGFILE=$LOGDIR"/logcatkernel.txt"
MV_FILES_SHELL="/system/bin/mv_files.sh"
XBL_UEFI_LOG="/dev/logfs/UefiLog0.txt"

NUM_MAX=128
NUM_MIN=64

size=$(getprop persist.offlinelog.kernel.size)
if [ -z "$size" ]; then
        num=$NUM_MIN
else
        num=$(($size/10))
fi

if [ "$num" -gt "$NUM_MAX" ] || [ "$num" -lt "NUM_MIN" ]; then
        num=$NUM_MIN
fi

date >> $LOGFILE
# append bootloader log
finish=$(getprop service.offlinelog.bootloader)
if [ -z "$finish" ] || [ "$finish" -eq "false" ]; then
        nl $XBL_UEFI_LOG >> $LOGFILE
        setprop service.offlinelog.bootloader true
fi

date >> $LOGFILE
logcat -b kernel -c
dmesg >> $LOGFILE

/system/bin/logcat -b kernel -r 10240 -n $num -v threadtime -f $LOGFILE
