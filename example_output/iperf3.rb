name :
	 Iperf3
homepage :
	 https://github.com/esnet/iperf
url :
	 https://github.com/esnet/iperf/archive/3.6.tar.gz
description :
	 Update of iperf: measures TCP, UDP, and SCTP bandwidth
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./bootstrap.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}",
	 "--with-openssl=#{Formula["openssl"].opt_prefix}"
	 system "make", "clean"
	 system "make", "install"
