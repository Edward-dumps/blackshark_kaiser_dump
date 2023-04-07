umask 022

LOGDIR=/data/local/log
LOGFILE=$LOGDIR"/dmesglog.txt"
MV_FILES_SHELL="/system/bin/mv_files.sh"
XBL_UEFI_LOG="/dev/logfs/UefiLog0.txt"

NUM_MAX=128
NUM_MIN=16

size=$(getprop persist.offlinelog.kernel.size)
if [ -z "$size" ]; then
        num=$NUM_MIN
else
        num=$(($size/10))
fi

if [ "$num" -gt "$NUM_MAX" ] || [ "$num" -lt "NUM_MIN" ]; then
        num=$NUM_MIN
fi

# append bootloader log
finish=$(getprop service.offlinelog.bootloader)
if [ -z "$finish" ] || [ "$finish" -eq "false" ]; then
	nl $XBL_UEFI_LOG >> $LOGFILE
	setprop service.offlinelog.bootloader true
fi

while [ 1 ]
do
	date >> $LOGFILE
	echo "" >> $LOGFILE
	dmesg -c >> $LOGFILE

	LOGSIZE=`du -shm $LOGFILE | sed 's/[[:blank:]].*//g'`

	if [ $LOGSIZE -gt 10 ]; then
		$MV_FILES_SHELL $LOGFILE $num
	fi
	sleep 2
done
