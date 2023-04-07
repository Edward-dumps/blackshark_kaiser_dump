# tinyplay file.wav [-D card] [-d device] [-p period_size] [-n n_periods]
# sample usage: playback.sh 2000.wav  1
set -x

sleep 1

echo "enabling main mic"
audio-factory-test -f enable_main-mic

# start recording
tinycap /sdcard/rcv2main_mic.wav -r 48000 -b 16 -T 6 && echo "capture done" &



sleep 2

audio-factory-test -f enable_receiver
tinyplay /vendor/etc/rcv_seal.wav
sleep 1


audio-factory-test -f disable_main-mic
audio-factory-test -f disable_receiver

