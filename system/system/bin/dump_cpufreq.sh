#!/system/bin/sh

LITTLE_CLUSTER_DIR="/sys/devices/system/cpu/cpu0/cpufreq"
BIG_CLUSTER_DIR="/sys/devices/system/cpu/cpu4/cpufreq"


GOVERNOR="scaling_governor"
MIN_FREQ="scaling_min_freq"
MAX_FREQ="scaling_max_freq"

GPU_DIR="/sys/class/kgsl/kgsl-3d0/devfreq"

GPU_GOVERNOR="governor"
GPU_FREQ="cur_freq"
GPU_LOAD="gpu_load"

SCHED_DIR="/proc/sys/kernel"
SCHED_UP="sched_upmigrate"
SCHED_DOWN="sched_downmigrate"

if [ -d ${LITTLE_CLUSTER_DIR} ]
then
    governor=`cat ${LITTLE_CLUSTER_DIR}/${GOVERNOR}`
    freq_min_l=`cat ${LITTLE_CLUSTER_DIR}/${MIN_FREQ}`
    freq_max_l=`cat ${LITTLE_CLUSTER_DIR}/${MAX_FREQ}`
    freq_min_b=`cat ${BIG_CLUSTER_DIR}/${MIN_FREQ}`
    freq_max_b=`cat ${BIG_CLUSTER_DIR}/${MAX_FREQ}`

    echo "Dump of CPU freq"
    echo "---------------------------------"
    printf "%-21s%12s\n" ${GOVERNOR} ${governor}
    echo   "\n#little cluster"
    printf "%-21s%12d\n" ${MIN_FREQ} ${freq_min_l}
    printf "%-21s%12d\n" ${MAX_FREQ} ${freq_max_l}
    echo   "\n#big cluster"
    printf "%-21s%12d\n" ${MIN_FREQ} ${freq_min_b}
    printf "%-21s%12d\n" ${MAX_FREQ} ${freq_max_b}
fi

echo ""

if [ -d ${SCHED_DIR} ]
then
    migrate_up=`cat ${SCHED_DIR}/${SCHED_UP}`
    migrate_down=`cat ${SCHED_DIR}/${SCHED_DOWN}`

    echo "Dump of sched threshold"
    echo "---------------------------------"
    printf "%-21s%12d\n" ${SCHED_UP} ${migrate_up}
    printf "%-21s%12d\n" ${SCHED_DOWN} ${migrate_down}
fi

echo ""

if [ -d ${GPU_DIR} ]
then
    governor=`cat ${GPU_DIR}/${GPU_GOVERNOR}`
    gpu_freq=`cat ${GPU_DIR}/${GPU_FREQ}`
    gpu_load=`cat ${GPU_DIR}/${GPU_LOAD}`

    echo "Dump of GPU freq"
    echo "---------------------------------"
    printf "%-19s%14s\n" ${GPU_GOVERNOR} ${governor}
    printf "%-21s%12d\n" ${GPU_FREQ} ${gpu_freq}
    printf "%-21s%12d\n" ${GPU_LOAD} ${gpu_load}
fi
