name :
	 MysqlAT57
homepage :
	 https://dev.mysql.com/doc/refman/5.7/en/
url :
	 https://cdn.mysql.com/Downloads/MySQL-5.7/mysql-boost-5.7.24.tar.gz
description :
	 Open source relational database management system
build_deps :
	 cmake
link_deps :
	 :macos
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 -DCOMPILATION_COMMENT=Homebrew
	 -DDEFAULT_CHARSET=utf8
	 -DDEFAULT_COLLATION=utf8_general_ci
	 -DINSTALL_DOCDIR=share/doc/#{name}
	 -DINSTALL_INCLUDEDIR=include/mysql
	 -DINSTALL_INFODIR=share/info
	 -DINSTALL_MANDIR=share/man
	 -DINSTALL_MYSQLSHAREDIR=share/mysql
	 -DINSTALL_PLUGINDIR=lib/plugin
	 -DMYSQL_DATADIR=#{datadir}
	 -DSYSCONFDIR=#{etc}
	 -DWITH_BOOST=boost
	 -DWITH_EDITLINE=system
	 -DWITH_SSL=yes
	 -DWITH_UNIT_TESTS=OFF
	 -DWITH_EMBEDDED_SERVER=ON
	 -DENABLED_LOCAL_INFILE=1
	 -DWITH_INNODB_MEMCACHED=ON
	 ]
	 system "cmake", ".", *std_cmake_args, *args
	 system "make"
	 system "make", "install"
	 (prefix/"mysql-test").cd do
	 system "./mysql-test-run.pl", "status", "--vardir=#{Dir.mktmpdir}"
	 datadir.mkpath
	 unless (datadir/"mysql/general_log.CSM").exist?
	 ENV["TMPDIR"] = nil
	 system bin/"mysqld", "--initialize-insecure", "--user=#{ENV["USER"]}",
	 "--basedir=#{prefix}", "--datadir=#{datadir}", "--tmpdir=/tmp"
