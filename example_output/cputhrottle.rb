name :
	 Cputhrottle
homepage :
	 http://www.willnolan.com/cputhrottle/cputhrottle.html
url :
	 http://www.willnolan.com/cputhrottle/cputhrottle-1.0.0.tar.gz
description :
	 Limit the CPU usage of a process
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
	 system "make", "all"
	 bin.install "cputhrottle"
