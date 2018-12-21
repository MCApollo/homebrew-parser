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
	 (var/"lib/ganglia/rrds").mkpath
