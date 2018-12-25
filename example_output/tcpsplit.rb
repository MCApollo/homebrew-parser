name :
	 Tcpsplit
homepage :
	 https://www.icir.org/mallman/software/tcpsplit/
url :
	 https://www.icir.org/mallman/software/tcpsplit/tcpsplit-0.2.tar.gz
description :
	 Break a packet trace into some number of sub-traces
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
	 system "make"
	 bin.install "tcpsplit"
