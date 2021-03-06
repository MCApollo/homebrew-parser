name :
	 MysqlAT56
homepage :
	 https://dev.mysql.com/doc/refman/5.6/en/
url :
	 https://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.42.tar.gz
description :
	 Open source relational database management system
build_deps :
	 cmake
link_deps :
	 pidof
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "cmake/libutils.cmake",
	 "COMMAND /usr/bin/libtool -static -o ${TARGET_LOCATION}",
	 "COMMAND libtool -static -o ${TARGET_LOCATION}"
	 args = %W[
	 -DMYSQL_DATADIR=#{datadir}
	 -DINSTALL_INCLUDEDIR=include/mysql
	 -DINSTALL_MANDIR=share/man
	 -DINSTALL_DOCDIR=share/doc/#{name}
	 -DINSTALL_INFODIR=share/info
	 -DINSTALL_MYSQLSHAREDIR=share/mysql
	 -DWITH_SSL=system
	 -DDEFAULT_CHARSET=utf8
	 -DDEFAULT_COLLATION=utf8_general_ci
	 -DSYSCONFDIR=#{etc}
	 -DCOMPILATION_COMMENT=Homebrew
	 -DWITH_EDITLINE=system
	 -DWITH_UNIT_TESTS=OFF
	 -DWITH_EMBEDDED_SERVER=ON
	 -DWITH_ARCHIVE_STORAGE_ENGINE=1
	 -DWITH_BLACKHOLE_STORAGE_ENGINE=1
	 -DENABLED_LOCAL_INFILE=1
	 -DWITH_INNODB_MEMCACHED=1
	 ]
	 system "cmake", ".", *std_cmake_args, *args
	 system "make"
	 system "make", "install"
	 (prefix/"mysql-test").cd do
	 system "./mysql-test-run.pl", "status", "--vardir=#{Dir.mktmpdir}"
	 end
	 rm_rf prefix/"mysql-test"
	 rm_rf prefix/"data"
	 bin.install_symlink prefix/"scripts/mysql_install_db"
	 inreplace "#{prefix}/support-files/mysql.server",
	 /^(PATH=".*)(")/, "\\1:#{HOMEBREW_PREFIX}/bin\\2"
	 bin.install_symlink prefix/"support-files/mysql.server"
	 libexec.install bin/"mysqlaccess"
	 libexec.install bin/"mysqlaccess.conf"
	 (buildpath/"my.cnf").write <<~EOS
	 [mysqld]
	 bind-address = 127.0.0.1
	 EOS
	 etc.install "my.cnf"
	 datadir.mkpath
	 unless (datadir/"mysql/general_log.CSM").exist?
	 ENV["TMPDIR"] = nil
	 system bin/"mysql_install_db", "--verbose", "--user=#{ENV["USER"]}",
	 "--basedir=#{prefix}", "--datadir=#{datadir}", "--tmpdir=/tmp"
	 end
