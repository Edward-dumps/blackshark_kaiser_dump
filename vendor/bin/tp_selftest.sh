#! /system/bin/sh
brightness=($(cat /sys/class/backlight/panel0-backlight/brightness))
if [ $brightness -eq 0 ];
then
    echo "backlight is 0,pls do tp_selftest when screen on"
    echo "TEST_FAIL1"
        exit
fi
if [ -f /sys/bus/spi/devices/spi0.0/fts_test ];
then
        echo "FOCALTECH"
else
        echo "TEST_FAIL2"
        exit
fi

echo "Conf_MultipleTest_k30.ini" > /sys/bus/spi/devices/spi0.0/fts_test
test_result=$(cat /sys/bus/spi/devices/spi0.0/fts_test)
if  [ "$test_result" == "PASS" ]; then
    echo "TEST_PASS"
else
    echo "TEST_FAIL3"
fi

mkdir -p /data/misc/tp_selftest_data
echo $test_result >> /data/misc/tp_selftest_data/result.txt
