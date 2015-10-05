sudo su -
sudo -u postgres /usr/pgsql-9.3/bin/psql << EOF
CREATE USER irods WITH PASSWORD 'testpassword';
create database icat;
grant all privileges on database icat to irods;
EOF
yum -y install ./irods-icat-4.1.6-centos7-x86_64.rpm 
#rpm -i irods-icat-4.1.6-centos7-x86_64.rpm
yum -y install ./irods-database-plugin-postgres93-1.6-centos7-x86_64.rpm
#rpm -i irods-database-plugin-postgres-1.6-centos7-x86_64.rpm
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
