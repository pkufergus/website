

LOG_DIR=/var/data/log/

FROM=$1
if [ "$FROM" == "" ]; then
	exit -1
fi

case $FROM in
"USA")
	echo  "$FROM"
	log_file=$LOG_DIR/USA`date +%Y%m%d%H%M%S`.log
	echo "logfile=$log_file"
	cd /opt/srv/epower && nohup python epower.py --country=USA --platform=traveltochina --limit=20000000 --threadnum=20 >$log_file 2>&1 &
	;;
CA)
	echo  "$FROM"
	log_file=$LOG_DIR/CA`date +%Y%m%d%H%M%S`.log
	echo "logfile=$log_file"
	cd /opt/srv/epower && nohup python epower.py --country=CA --platform=TraveltoChinaCorp --limit=1000000 --threadnum=20 >$log_file 2>&1 &
	;;
"CN")
	echo  "$FROM"
	log_file=$LOG_DIR/CN`date +%Y%m%d%H%M%S`.log
	echo "logfile=$log_file"
	cd /opt/srv/epower && nohup python epower.py --country=CN --platform=traveltochina --limit=1000000 --threadnum=20 >$log_file 2>&1 &
	;;
"BOOK")
	echo  "$FROM"
	log_file=$LOG_DIR/BOOK`date +%Y%m%d%H%M%S`.log
	echo "logfile=$log_file"
	cd /opt/srv/epower && nohup python epower.py --country=USA --platform=traveltochina --limit=1000000 --threadnum=20 --type=book >$log_file 2>&1 &
	;;
*)
	echo  "$FROM unknow type"
	;;
esac
