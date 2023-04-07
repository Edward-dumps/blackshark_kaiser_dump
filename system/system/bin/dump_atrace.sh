#!/system/bin/sh

atracePath="/data/junk-server"
if [ ! -d "${atracePath}" ]; then
    exit 0
fi

log "dump atrace start"
atraceFile="/data/junk-server/atrace.atrace"
screenFile="/data/junk-server/screen.png"
log $1

if [ -f "${atraceFile}" ]; then
    rm -rf ${atraceFile}
fi

if [ -f "${screenFile}" ]; then
    rm -rf ${screenFile}
fi

log "dump atrace.atrace and screen.png begin"
atrace --async_stop -z -c -o  /data/junk-server/atrace.atrace
atrace -c -b 2048 gfx input view wm am sm audio video camera hal res dalvik power pm ss sched freq idle disk --async_start
screencap -p /data/junk-server/screen.png
log "dump atrace.atrace and screen.png end"

if [ -f "${atraceFile}" ]; then
    #echo $file
    cp -r ${atraceFile} $1
fi

if [ -f "${screenFile}" ]; then
    #echo $file
    cp -r ${screenFile} $1
fi

log "dump atrace end"
