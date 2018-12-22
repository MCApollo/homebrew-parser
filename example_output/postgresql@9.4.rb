name :
	 PostgresqlAT94
homepage :
	 https://www.postgresql.org/
url :
	 https://ftp.postgresql.org/pub/source/v9.4.19/postgresql-9.4.19.tar.bz2
description :
	 Object-relational database system
build_deps :
link_deps :
	 openssl
	 readline
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 if MacOS.version == :sierra || MacOS.version == :el_capitan
	 ENV["SDKROOT"] = MacOS.sdk_path
	 end
	 ENV.prepend "LDFLAGS", "-L#{Formula["openssl"].opt_lib} -L#{Formula["readline"].opt_lib}"
	 ENV.prepend "CPPFLAGS", "-I#{Formula["openssl"].opt_include} -I#{Formula["readline"].opt_include}"
	 ENV.append_to_cflags "-D_XOPEN_SOURCE"
	 args = %W[
	 --disable-debug
	 --prefix=#{prefix}
	 --datadir=#{pkgshare}
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
	 args << "--with-python" if build.with? "python@2"
	 if MacOS.version >= :mavericks || MacOS::CLT.installed?
	 args << "--with-tcl"
	 if File.exist?("#{MacOS.sdk_path}/System/Library/Frameworks/Tcl.framework/tclConfig.sh")
	 args << "--with-tclconfig=#{MacOS.sdk_path}/System/Library/Frameworks/Tcl.framework"
	 end
	 end
	 if DevelopmentTools.clang_build_version >= 1000
	 inreplace "configure",
	 "-I$perl_archlibexp/CORE",
	 "-iwithsysroot $perl_archlibexp/CORE"
	 inreplace "src/pl/plperl/GNUmakefile",
	 "-I$(perl_archlibexp)/CORE",
	 "-iwithsysroot $(perl_archlibexp)/CORE"
	 end
	 system "./configure", *args
	 if DevelopmentTools.clang_build_version >= 1000
	 system "make", "all"
	 system "make", "-C", "contrib", "install", "all"
	 system "make", "install", "all"
	 else
	 system "make", "install-world"
	 end
	 (var/"log").mkpath
	 (var/name).mkpath
	 unless File.exist? "#{var}/#{name}/PG_VERSION"
	 system "#{bin}/initdb", "#{var}/#{name}"
	 end
