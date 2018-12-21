name :
	 IcarusVerilog
homepage :
	 http://iverilog.icarus.com/
url :
	 ftp://icarus.com/pub/eda/verilog/v10/verilog-10.2.tar.gz
description :
	 Verilog simulation and synthesis tool
build_deps :
	 bison
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "autoconf" if build.head?
	 system "./configure", "--prefix=#{prefix}"
	 ENV.deparallelize
	 system "make", "install", "BISON=#{Formula["bison"].opt_bin}/bison"
