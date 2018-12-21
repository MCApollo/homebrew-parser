name :
	 BaculaFd
homepage :
	 https://www.bacula.org/
url :
	 https://downloads.sourceforge.net/project/bacula/bacula/9.2.0/bacula-9.2.0.tar.gz
description :
	 Network backup solution
build_deps :
link_deps :
	 openssl
	 readline
conflicts :
	 bareos-client
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--sbindir=#{bin}",
	 "--with-working-dir=#{var}/lib/bacula",
	 "--with-pid-dir=#{var}/run",
	 "--with-logdir=#{var}/log/bacula",
	 "--enable-client-only",
	 "--disable-conio",
	 "--with-readline=#{Formula["readline"].opt_prefix}"
	 system "make"
	 system "make", "install"
	 (var/"lib/bacula").mkpath
	 (var/"run").mkpath
