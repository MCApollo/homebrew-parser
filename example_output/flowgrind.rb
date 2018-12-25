name :
	 Flowgrind
homepage :
	 https://launchpad.net/flowgrind
url :
	 https://launchpad.net/flowgrind/trunk/flowgrind-0.8.0/+download/flowgrind-0.8.0.tar.bz2
description :
	 TCP measurement tool, similar to iperf or netperf
build_deps :
link_deps :
	 gsl
	 xmlrpc-c
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
