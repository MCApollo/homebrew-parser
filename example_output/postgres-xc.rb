name :
	 PostgresXc
homepage :
	 https://postgres-xc.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/postgres-xc/Version_1.0/pgxc-v1.0.4.tar.gz
description :
	 PostgreSQL cluster based on shared-nothing architecture
build_deps :
link_deps :
	 :arch
	 openssl
	 ossp-uuid
	 readline
optional_deps :
conflicts :
	 postgresql
resource :
	 []
	 []
patches :
EOF_patch :
	 --- a/src/pl/plpython/Makefile	2011-09-23 08:03:52.000000000 +1000
	 +++ b/src/pl/plpython/Makefile	2011-10-26 21:43:40.000000000 +1100
	 @@ -24,8 +24,6 @@
	 ifeq ($(PORTNAME), darwin)
	 shared_libpython = yes
	 -override python_libspec = -framework Python
	 -override python_additional_libs =
	 endif
install :
	 ENV.append_to_cflags "-D_XOPEN_SOURCE"
	 ENV.append "CFLAGS", "-D_FORTIFY_SOURCE=0 -O2" if MacOS.version >= :mavericks
	 ENV.prepend "LDFLAGS", "-L#{Formula["openssl"].opt_lib} -L#{Formula["readline"].opt_lib}"
	 ENV.prepend "CPPFLAGS", "-I#{Formula["openssl"].opt_include} -I#{Formula["readline"].opt_include}"
	 ENV.append "CFLAGS", `uuid-config --cflags`.strip
	 ENV.append "LDFLAGS", `uuid-config --ldflags`.strip
	 ENV.append "LIBS", `uuid-config --libs`.strip
	 args = [
	 "--disable-debug",
	 "--prefix=#{prefix}",
	 "--datadir=#{pkgshare}",
	 "--docdir=#{doc}",
	 "--enable-thread-safety",
	 "--with-bonjour",
	 "--with-gssapi",
	 "--with-krb5",
	 "--with-libxml",
	 "--with-libxslt",
	 "--with-openssl",
	 "--with-ossp-uuid",
	 "ARCHFLAGS=-arch x86_64",
	 ]
	 system "./configure", *args
	 inreplace "GNUmakefile", "recurse,install-world,doc-xc src", "recurse,install-world,src"
	 system "make", "install-world"
	 plist_path("gtm").write gtm_startup_plist("gtm")
	 plist_path("gtm").chmod 0644
	 plist_path("gtm_proxy").write gtm_proxy_startup_plist("gtm_proxy")
	 plist_path("gtm_proxy").chmod 0644
	 plist_path("coord").write coordinator_startup_plist("coord")
	 plist_path("coord").chmod 0644
	 plist_path("datanode").write datanode_startup_plist("datanode")
	 plist_path("datanode").chmod 0644
	 (var/"postgres-xc").mkpath
