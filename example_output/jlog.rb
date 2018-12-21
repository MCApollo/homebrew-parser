name :
	 Jlog
homepage :
	 https://labs.omniti.com/labs/jlog
url :
	 https://github.com/omniti-labs/jlog/archive/2.3.2.tar.gz
description :
	 Pure C message queue with subscribers and publishers for logs
build_deps :
	 autoconf
	 automake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "autoconf"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
