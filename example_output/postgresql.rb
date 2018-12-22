name :
	 Postgresql
homepage :
	 https://www.postgresql.org/
url :
	 https://ftp.postgresql.org/pub/source/v11.1/postgresql-11.1.tar.bz2
description :
	 Object-relational database system
build_deps :
	 pkg-config
link_deps :
	 icu4c
	 openssl
	 readline
	 python
conflicts :
	 postgres-xc
patches :
EOF_patch :
install :
	 ENV["XML2_CONFIG"] = "xml2-config --exec-prefix=/usr"
	 ENV.prepend "LDFLAGS", "-L#{Formula["openssl"].opt_lib} -L#{Formula["readline"].opt_lib}"
	 ENV.prepend "CPPFLAGS", "-I#{Formula["openssl"].opt_include} -I#{Formula["readline"].opt_include}"
	 args = %W[
	 --disable-debug
	 --prefix=#{prefix}
	 --datadir=#{HOMEBREW_PREFIX}/share/postgresql
	 --libdir=#{HOMEBREW_PREFIX}/lib
	 --sysconfdir=#{etc}
	 --docdir=#{doc}
	 --enable-thread-safety
	 --with-bonjour
	 --with-gssapi
	 --with-icu
	 --with-ldap
	 --with-libxml
	 --with-libxslt
	 --with-openssl
	 --with-pam
	 --with-perl
	 --with-uuid=e2fs
	 ]
	 if build.with?("python")
	 args << "--with-python"
	 ENV["PYTHON"] = which("python3")
	 end
	 if MacOS.version >= :mavericks || MacOS::CLT.installed?
	 args << "--with-tcl"
	 if File.exist?("#{MacOS.sdk_path}/System/Library/Frameworks/Tcl.framework/tclConfig.sh")
	 args << "--with-tclconfig=#{MacOS.sdk_path}/System/Library/Frameworks/Tcl.framework"
	 end
	 end
	 system "./configure", *args
	 system "make"
	 system "make", "install-world", "datadir=#{pkgshare}",
	 "libdir=#{lib}",
	 "pkglibdir=#{lib}/postgresql"
	 (var/"log").mkpath
	 (var/"postgres").mkpath
	 unless File.exist? "#{var}/postgres/PG_VERSION"
	 system "#{bin}/initdb", "#{var}/postgres"
	 end
