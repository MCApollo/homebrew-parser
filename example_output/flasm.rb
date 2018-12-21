name :
	 Flasm
homepage :
	 http://www.nowrap.de/flasm.html
url :
	 http://www.nowrap.de/download/flasm16src.zip
description :
	 Flash command-line assembler and disassembler
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "CC=#{ENV.cc}", "CFLAGS=#{ENV.cflags}"
	 bin.install "flasm"
