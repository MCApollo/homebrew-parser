name :
	 PostgresqlAT96
homepage :
	 https://www.postgresql.org/
url :
	 https://ftp.postgresql.org/pub/source/v9.6.10/postgresql-9.6.10.tar.bz2
description :
	 Object-relational database system
build_deps :
link_deps :
	 openssl
	 readline
	 python
conflicts :
patches :
EOF_patch :
install :
	 ENV["XML2_CONFIG"] = "xml2-config --exec-prefix=/usr"
	 ENV.prepend "LDFLAGS", "-L#{Formula["openssl"].opt_lib} -L#{Formula["readline"].opt_lib}"
	 ENV.prepend "CPPFLAGS", "-I#{Formula["openssl"].opt_include} -I#{Formula["readline"].opt_include}"
	 args = %W[
	 --disable-debug
	 --prefix=#{prefix}
	 --datadir=#{pkgshare}
	 --libdir=#{lib}
	 --sysconfdir=#{prefix}/etc
	 --docdir=#{doc}
	 --enable-thread-safety
	 --with-bonjour
	 --with-gssapi
	 --with-ldap
	 --with-openssl
	 --with-pam
	 --with-libxml
	 --with-libxslt
	 --with-perl
	 --with-uuid=e2fs
	 ]
	 if build.with?("python")
	 args << "--with-python"
	 ENV["PYTHON"] = which("python3")
	 (var/"log").mkpath
	 (var/name).mkpath
	 unless File.exist? "#{var}/#{name}/PG_VERSION"
	 system "#{bin}/initdb", "#{var}/#{name}"
