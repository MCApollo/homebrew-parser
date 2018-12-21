name :
	 PerconaServer
homepage :
	 https://www.percona.com
url :
	 https://www.percona.com/downloads/Percona-Server-5.7/Percona-Server-5.7.24-26/source/tarball/percona-server-5.7.24-26.tar.gz
description :
	 Drop-in MySQL replacement
build_deps :
	 cmake
link_deps :
	 :macos
	 openssl
conflicts :
	 mariadb
	 mysql
	 mysql-cluster
	 mysql-connector-c
	 mariadb-connector-c
patches :
EOF_patch :
install :
	 ENV.prepend "CPPFLAGS", "-DHAVE_MEMSET_S=1"
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
	 -DWITH_EDITLINE=system
	 -DWITH_SSL=yes
	 ]
	 (buildpath/"boost").install resource("boost")
	 args << "-DWITH_BOOST=#{buildpath}/boost"
	 args.concat %w[-DWITHOUT_ROCKSDB=1]
	 args.concat %w[-DWITHOUT_TOKUDB=1]
	 args << "-DWITH_UNIT_TESTS=OFF"
	 system "cmake", ".", *std_cmake_args, *args
	 system "make"
	 system "make", "install"
	 (prefix/"mysql-test").cd do
	 system "./mysql-test-run.pl", "status", "--vardir=#{Dir.mktmpdir}"
	 datadir.mkpath
	 unless (datadir/"mysql/user.frm").exist?
	 ENV["TMPDIR"] = nil
	 system bin/"mysqld", "--initialize-insecure", "--user=#{ENV["USER"]}",
	 "--basedir=#{prefix}", "--datadir=#{datadir}", "--tmpdir=/tmp"
