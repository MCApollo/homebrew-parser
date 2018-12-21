name :
	 MariadbAT102
homepage :
	 https://mariadb.org/
url :
	 https://downloads.mariadb.org/f/mariadb-10.2.19/source/mariadb-10.2.19.tar.gz
description :
	 Drop-in replacement for MySQL
build_deps :
	 cmake
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 inreplace "scripts/mysql_install_db.sh" do |s|
	 s.change_make_var! "basedir", "\"#{prefix}\""
	 s.change_make_var! "ldata", "\"#{var}/mysql\""
	 (var/"mysql").mkpath
	 unless File.exist? "#{var}/mysql/mysql/user.frm"
	 ENV["TMPDIR"] = nil
	 system "#{bin}/mysql_install_db", "--verbose", "--user=#{ENV["USER"]}",
	 "--basedir=#{prefix}", "--datadir=#{var}/mysql", "--tmpdir=/tmp"
