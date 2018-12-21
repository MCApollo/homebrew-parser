name :
	 MysqlCluster
homepage :
	 https://www.mysql.com/products/cluster/
url :
	 https://dev.mysql.com/get/Downloads/MySQL-Cluster-7.5/mysql-cluster-gpl-7.5.7.tar.gz
description :
	 Shared-nothing clustering and auto-sharding for MySQL
build_deps :
	 cmake
link_deps :
	 :java
	 pidof
	 openssl
conflicts :
	 memcached
	 mysql
	 mariadb
	 percona-server
	 mysql-connector-c
patches :
EOF_patch :
install :
	 (var/"mysql-cluster").mkpath
	 if MacOS.version == "10.11" && MacOS::Xcode.installed? && MacOS::Xcode.version >= "8.0"
	 inreplace "configure.cmake", "(clock_gettime", "(everything_is_terrible"
	 (var/"mysql-cluster/ndb_data").mkpath
	 (var/"mysql-cluster/mysqld_data").mkpath
	 (var/"mysql-cluster/conf").mkpath
	 (var/"mysql-cluster/conf/my.cnf").write my_cnf unless File.exist? var/"mysql-cluster/conf/my.cnf"
	 (var/"mysql-cluster/conf/config.ini").write config_ini unless File.exist? var/"mysql-cluster/conf/config.ini"
