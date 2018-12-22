name :
	 MariadbAT100
homepage :
	 https://mariadb.org/
url :
	 https://downloads.mariadb.org/f/mariadb-10.0.37/source/mariadb-10.0.37.tar.gz
description :
	 Drop-in replacement for MySQL
build_deps :
	 cmake
link_deps :
	 pidof
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 inreplace "scripts/mysql_install_db.sh" do |s|
	 s.change_make_var! "basedir", "\"#{prefix}\""
	 s.change_make_var! "ldata", "\"#{var}/mysql\""
	 end
	 args = %W[
	 -DMYSQL_DATADIR=#{var}/mysql
	 -DINSTALL_INCLUDEDIR=include/mysql
	 -DINSTALL_MANDIR=share/man
	 -DINSTALL_DOCDIR=share/doc/#{name}
	 -DINSTALL_INFODIR=share/info
	 -DINSTALL_MYSQLSHAREDIR=share/mysql
	 -DWITH_PCRE=bundled
	 -DWITH_READLINE=yes
	 -DWITH_SSL=yes
	 -DWITH_UNIT_TESTS=OFF
	 -DDEFAULT_CHARSET=utf8mb4
	 -DDEFAULT_COLLATION=utf8mb4_general_ci
	 -DINSTALL_SYSCONFDIR=#{etc}
	 -DCOMPILATION_COMMENT=Homebrew
	 ]
	 args << "-DWITHOUT_TOKUDB=1"
	 system "cmake", ".", *std_cmake_args, *args
	 system "make"
	 system "make", "install"
	 (etc+"my.cnf.d").mkpath
	 inreplace "#{etc}/my.cnf", "!includedir /etc/my.cnf.d",
	 "!includedir #{etc}/my.cnf.d"
	 touch etc/"my.cnf.d/.homebrew_dont_prune_me"
	 rm_rf prefix+"data"
	 (prefix+"mysql-test").rmtree
	 (prefix+"sql-bench").rmtree
	 bin.install_symlink prefix/"scripts/mysql_install_db"
	 inreplace "#{prefix}/support-files/mysql.server", /^(PATH=".*)(")/, "\\1:#{HOMEBREW_PREFIX}/bin\\2"
	 bin.install_symlink prefix/"support-files/mysql.server"
	 (buildpath/"my.cnf").write <<~EOS
	 [mysqld]
	 bind-address = 127.0.0.1
	 EOS
	 etc.install "my.cnf"
	 (var+"mysql").mkpath
	 unless File.exist? "#{var}/mysql/mysql/user.frm"
	 ENV["TMPDIR"] = nil
	 system "#{bin}/mysql_install_db", "--verbose", "--user=#{ENV["USER"]}",
	 "--basedir=#{prefix}", "--datadir=#{var}/mysql", "--tmpdir=/tmp"
	 end
