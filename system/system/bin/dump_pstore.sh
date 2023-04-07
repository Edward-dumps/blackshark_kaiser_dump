#!/system/bin/sh

PSTORE_DIR=`getprop persist.sys.pstore.path`
if [ -z "$PSTORE_DIR" ];then
       echo "PSTORE_DIR is empty"
   else
       cat ${PSTORE_DIR}
fi

