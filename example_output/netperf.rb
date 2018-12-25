name :
	 Netperf
homepage :
	 https://hewlettpackard.github.io/netperf/
url :
	 https://github.com/HewlettPackard/netperf/archive/netperf-2.7.0.tar.gz
description :
	 Benchmarks performance of many different types of networking
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
