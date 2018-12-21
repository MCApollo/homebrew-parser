name :
	 Dasm
homepage :
	 https://dasm-dillon.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/dasm-dillon/dasm-dillon/2.20.11/dasm-2.20.11-2014.03.04-source.tar.gz
description :
	 Macro assembler with support for several 8-bit microprocessors
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 prefix.install "bin", "doc"
