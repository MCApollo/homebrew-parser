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
optional_deps :
conflicts :
	 mariadb
	 mysql
	 mysql-cluster
	 mysql-connector-c
	 mariadb-connector-c
resource :
	 ['boost']
	 ['https://downloads.sourceforge.net/project/boost/boost/1.59.0/boost_1_59_0.tar.bz2']
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
	 unless (datadir/"mysql/user.frm").exist?
	 ENV["TMPDIR"] = nil
	 system bin/"mysqld", "--initialize-insecure", "--user=#{ENV["USER"]}",
	 "--basedir=#{prefix}", "--datadir=#{datadir}", "--tmpdir=/tmp"
	 end
