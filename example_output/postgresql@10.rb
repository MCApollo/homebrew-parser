name :
	 PostgresqlAT10
homepage :
	 https://www.postgresql.org/
url :
	 https://ftp.postgresql.org/pub/source/v10.6/postgresql-10.6.tar.bz2
description :
	 Object-relational database system
build_deps :
	 pkg-config
link_deps :
	 icu4c
	 openssl
	 readline
optional_deps :
	 python
conflicts :
resource :
	 []
	 []
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
	 ENV.prepend "LDFLAGS", "-L#{Formula["openssl"].opt_lib} -L#{Formula["readline"].opt_lib} -R#{lib}/postgresql"
	 system "./configure", *args
	 system "make"
	 dirs = %W[datadir=#{pkgshare} libdir=#{lib} pkglibdir=#{lib}]
	 if DevelopmentTools.clang_build_version >= 1000
	 system "make", "all"
	 system "make", "-C", "contrib", "install", "all", *dirs
	 system "make", "install", "all", *dirs
	 else
	 system "make", "install-world", *dirs
	 end
	 (var/"log").mkpath
	 (var/"postgres").mkpath
	 unless File.exist? "#{var}/postgres/PG_VERSION"
	 system "#{bin}/initdb", "#{var}/postgres"
	 end
