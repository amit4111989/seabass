sudo su -
# Configure head node
echo "DAEMON_LIST = MASTER, COLLECTOR, NEGOTIATOR, STARTD, SCHEDD" > /etc/condor/config.d
sudo /sbin/service condor start
sudo /sbin/chkconfig condor on
