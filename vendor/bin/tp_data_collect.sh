#! /system/bin/sh
IMEI=$(getprop persist.radio.imei)
if [ ! $IMEI ];
then
    echo "No IMEI, use default value"
    IMEI="000000"
fi
mkdir -p /data/misc/tp_selftest_data

DATA_FILE_NAME=/data/misc/tp_selftest_data/${IMEI}"_data.csv"
echo "data:"$DATA_FILE_NAME
RESULT_FILE_NAME=/data/misc/tp_selftest_data/${IMEI}"_result.txt"
echo "result:"$RESULT_FILE_NAME
rm -f $DATA_FILE_NAME
rm -f $RESULT_FILE_NAME
cat /proc/tp_test_data >> $DATA_FILE_NAME
cat /proc/tp_test_result >> $RESULT_FILE_NAME
