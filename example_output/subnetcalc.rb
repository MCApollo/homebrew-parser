name :
	 Subnetcalc
homepage :
	 https://www.uni-due.de/~be0001/subnetcalc/
url :
	 https://www.uni-due.de/~be0001/subnetcalc/download/subnetcalc-2.4.9.tar.gz
description :
	 IPv4/IPv6 subnet calculator
build_deps :
	 cmake
link_deps :
	 geoip
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
