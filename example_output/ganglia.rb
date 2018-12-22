name :
	 Ganglia
homepage :
	 https://ganglia.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/ganglia/ganglia%20monitoring%20core/3.7.2/ganglia-3.7.2.tar.gz
description :
	 Scalable distributed monitoring system
build_deps :
	 pkg-config
link_deps :
	 apr
	 confuse
	 pcre
	 rrdtool
conflicts :
	 coreutils
patches :
EOF_patch :
install :
	 if build.head?
	 inreplace "bootstrap", "libtoolize", "glibtoolize"
	 inreplace "libmetrics/bootstrap", "libtoolize", "glibtoolize"
	 system "./bootstrap"
	 end
	 inreplace "configure", 'varstatedir="/var/lib"', %Q(varstatedir="#{var}/lib")
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--sbindir=#{bin}",
	 "--sysconfdir=#{etc}",
	 "--mandir=#{man}",
	 "--with-gmetad",
	 "--with-libapr=#{Formula["apr"].opt_bin}/apr-1-config",
	 "--with-libpcre=#{Formula["pcre"].opt_prefix}"
	 system "make", "install"
	 system "#{bin}/gmond -t > #{etc}/gmond.conf" unless File.exist? "#{etc}/gmond.conf"
	 (var/"lib/ganglia/rrds").mkpath
