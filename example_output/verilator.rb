name :
	 Verilator
homepage :
	 https://www.veripool.org/wiki/verilator
url :
	 https://www.veripool.org/ftp/verilator-3.926.tgz
description :
	 Verilog simulator
build_deps :
link_deps :
	 flex
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoconf" if build.head?
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
