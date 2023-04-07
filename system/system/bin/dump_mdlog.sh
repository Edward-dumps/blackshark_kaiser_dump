#!/system/bin/sh

offlinePath="/data/vendor/bslogs/modem"
dstPath="$1""/mdmlog.tar.gz"

if [ ! -d "${offlinePath}" ]; then
    #echo "No such file"
    exit 0
fi

findres=`find ${offlinePath} -name "*qmdl*"|wc -l`
if [ 0 -eq ${findres} ];then
    exit 0
fi

qmdl_file=`find ${offlinePath} -name "*qmdl"|xargs ls -t|head -2`
qdb_file=`find ${offlinePath} -name "*qdb"|xargs ls -t|head -2`
qsr4_file=`find ${offlinePath} -name "*qsr4*"|xargs ls -t|head -1`

tar -zcvf ${dstPath} ${qmdl_file} ${qdb_file} ${qsr4_file}
