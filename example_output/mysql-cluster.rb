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
optional_deps :
conflicts :
	 memcached
	 mysql
	 mariadb
	 percona-server
	 mysql-connector-c
resource :
	 ['boost']
	 ['https://downloads.sourceforge.net/project/boost/boost/1.59.0/boost_1_59_0.tar.bz2']
patches :
EOF_patch :
install :
	 (var/"mysql-cluster").mkpath
	 if MacOS.version == "10.11" && MacOS::Xcode.installed? && MacOS::Xcode.version >= "8.0"
	 inreplace "configure.cmake", "(clock_gettime", "(everything_is_terrible"
	 end
	 args = [".",
	 "-DCMAKE_INSTALL_PREFIX=#{prefix}",
	 "-DMYSQL_DATADIR=#{var}/mysql-cluster",
	 "-DINSTALL_MANDIR=#{man}",
	 "-DINSTALL_DOCDIR=#{doc}",
	 "-DINSTALL_INFODIR=#{info}",
	 "-DINSTALL_MYSQLSHAREDIR=#{share.basename}/mysql",
	 "-DWITH_SSL=yes",
	 "-DDEFAULT_CHARSET=utf8",
	 "-DDEFAULT_COLLATION=utf8_general_ci",
	 "-DSYSCONFDIR=#{etc}",
	 "-DWITH_UNIT_TESTS=OFF",
	 "-DWITH_READLINE=yes"]
	 (buildpath/"boost_1_59_0").install resource("boost")
	 args << "-DWITH_BOOST=#{buildpath}/boost_1_59_0"
	 system "cmake", *args
	 system "make"
	 system "make", "install"
	 (prefix/"mysql-test").cd do
	 system "./mysql-test-run.pl", "status", "--vardir=#{Dir.mktmpdir}"
	 end
	 rm_rf prefix/"mysql-test"
	 rm_rf prefix/"data"
	 bin.install_symlink prefix/"scripts/mysql_install_db"
	 inreplace "#{prefix}/support-files/mysql.server",
	 /^(PATH=".*)(")/,
	 "\\1:#{HOMEBREW_PREFIX}/bin\\2"
	 bin.install_symlink prefix/"support-files/mysql.server"
	 libexec.install bin/"mcc_config.py"
	 plist_path("ndb_mgmd").write ndb_mgmd_startup_plist("ndb_mgmd")
	 plist_path("ndb_mgmd").chmod 0644
	 plist_path("ndbd").write ndbd_startup_plist("ndbd")
	 plist_path("ndbd").chmod 0644
	 plist_path("mysqld").write mysqld_startup_plist("mysqld")
	 plist_path("mysqld").chmod 0644
	 (var/"mysql-cluster/ndb_data").mkpath
	 (var/"mysql-cluster/mysqld_data").mkpath
	 (var/"mysql-cluster/conf").mkpath
	 (var/"mysql-cluster/conf/my.cnf").write my_cnf unless File.exist? var/"mysql-cluster/conf/my.cnf"
	 (var/"mysql-cluster/conf/config.ini").write config_ini unless File.exist? var/"mysql-cluster/conf/config.ini"
