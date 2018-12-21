name :
	 Yosys
homepage :
	 http://www.clifford.at/yosys/
url :
	 https://github.com/cliffordwolf/yosys/archive/yosys-0.8.tar.gz
description :
	 Framework for Verilog RTL synthesis
build_deps :
	 bison
	 pkg-config
link_deps :
	 libffi
	 python
	 readline
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}", "PRETTY=0"
