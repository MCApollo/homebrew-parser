name :
	 Mysql
homepage :
	 https://dev.mysql.com/doc/refman/8.0/en/
url :
	 https://cdn.mysql.com/Downloads/MySQL-8.0/mysql-boost-8.0.12.tar.gz
description :
	 Open source relational database management system
build_deps :
	 cmake
link_deps :
	 :macos
	 :macos
	 openssl
conflicts :
	 mysql-cluster
	 mariadb
	 percona-server
	 mysql-connector-c
	 mariadb-connector-c
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
	 end
	 rm_rf prefix/"mysql-test"
	 rm_rf prefix/"data"
	 inreplace "#{prefix}/support-files/mysql.server",
	 /^(PATH=".*)(")/,
	 "\\1:#{HOMEBREW_PREFIX}/bin\\2"
	 bin.install_symlink prefix/"support-files/mysql.server"
	 (buildpath/"my.cnf").write <<~EOS
	 [mysqld]
	 bind-address = 127.0.0.1
	 EOS
	 etc.install "my.cnf"
	 datadir.mkpath
	 unless (datadir/"mysql/general_log.CSM").exist?
	 ENV["TMPDIR"] = nil
	 system bin/"mysqld", "--initialize-insecure", "--user=#{ENV["USER"]}",
	 "--basedir=#{prefix}", "--datadir=#{datadir}", "--tmpdir=/tmp"
	 end
