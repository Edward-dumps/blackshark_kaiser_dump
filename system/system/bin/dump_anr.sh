#!/system/bin/sh

offlinePath="/data/anr"
dstPath="$1""/mdmlog.tar.gz"
echo $1

if [ ! -d "${offlinePath}" ]; then
    #echo "No such file"
    exit 0
fi

anr_dir_file=`find ${offlinePath} | xargs ls -t|head -6`
#echo ${anr_dir_file}

for file in $anr_dir_file
do	
	if [ $file != '/data/anr:' ]
	then	
#		echo $file	
		cp -r $file $1
	fi	
done