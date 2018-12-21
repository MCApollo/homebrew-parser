name :
	 PerconaServerAT56
homepage :
	 https://www.percona.com
url :
	 https://www.percona.com/downloads/Percona-Server-5.6/Percona-Server-5.6.42-84.2/source/tarball/percona-server-5.6.42-84.2.tar.gz
description :
	 Drop-in MySQL replacement
build_deps :
	 cmake
link_deps :
	 pidof
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 inreplace "cmake/libutils.cmake",
	 "COMMAND /usr/bin/libtool -static -o ${TARGET_LOCATION}",
	 "COMMAND libtool -static -o ${TARGET_LOCATION}"
	 args = std_cmake_args + %W[
	 -DMYSQL_DATADIR=#{datadir}
	 -DINSTALL_PLUGINDIR=lib/plugin
	 -DSYSCONFDIR=#{etc}
	 -DINSTALL_MANDIR=#{man}
	 -DINSTALL_DOCDIR=#{doc}
	 -DINSTALL_INFODIR=#{info}
	 -DINSTALL_INCLUDEDIR=include/mysql
	 -DINSTALL_MYSQLSHAREDIR=#{share.basename}/mysql
	 -DWITH_SSL=yes
	 -DDEFAULT_CHARSET=utf8
	 -DDEFAULT_COLLATION=utf8_general_ci
	 -DCOMPILATION_COMMENT=Homebrew
	 -DWITH_EDITLINE=system
	 -DWITH_UNIT_TESTS=OFF
	 -DCMAKE_FIND_FRAMEWORK=LAST
	 -DCMAKE_VERBOSE_MAKEFILE=ON
	 ]
	 args.concat %w[
	 -DWITHOUT_AUTH_PAM=1
	 -DWITHOUT_AUTH_PAM_COMPAT=1
	 -DWITHOUT_DIALOG=1
	 ]
	 args.concat %w[-DWITHOUT_TOKUDB=1]
	 system "cmake", ".", *std_cmake_args, *args
	 system "make"
	 system "make", "install"
	 rm_rf prefix+"data"
	 bin.install_symlink prefix/"scripts/mysql_install_db"
	 inreplace "#{prefix}/support-files/mysql.server",
	 /^(PATH=".*)(")/, "\\1:#{HOMEBREW_PREFIX}/bin\\2"
	 bin.install_symlink prefix/"support-files/mysql.server"
	 libexec.mkpath
	 mv "#{bin}/mysqlaccess", libexec
	 mv "#{bin}/mysqlaccess.conf", libexec
	 (buildpath/"my.cnf").write <<~EOS
	 [mysqld]
	 bind-address = 127.0.0.1
	 EOS
	 etc.install "my.cnf"
	 datadir.mkpath
	 unless File.exist? "#{datadir}/mysql/user.frm"
	 ENV["TMPDIR"] = nil
	 system "#{bin}/mysql_install_db", "--verbose", "--user=#{ENV["USER"]}",
	 "--basedir=#{prefix}", "--datadir=#{datadir}", "--tmpdir=/tmp"
