sudo su -

rpm -i irods-resource-4.1.6-centos6-x86_64.rpm
#rpm -i irods-icat-4.1.6-centos7-x86_64.rpm
yum -y install ./irods-database-plugin-postgres93-1.6-centos7-x86_64.rpm
#rpm -i irods-database-plugin-postgres-1.6-centos7-x86_64.rpm
# need to properly configure the setup_irods.sh file
sh /var/lib/irods/packaging/setup_irods.sh <<!
 #iCAT Zone
 #iCAT Port
 #Parallel Port Range (Begin)
 #Parallel Port Range (End)
 #Vault Directory
 #zone_key
 #negotiation_key
 #Control Plane Port
 #Control Plane Key
 #Schema Validation Base URI
 #iRODS Administrator Username
rods #iRODS Administrator Password
 #Database Server's Hostname or IP
 #Database Port
 #Database Name
 #Database User
testpassword #Database Password
!

echo "DAEMON_LIST = MASTER,STARTD" > /etc/condor/config.d
sudo /sbin/service condor start
sudo /sbin/chkconfig condor on
