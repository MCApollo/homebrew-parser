name :
	 Z80dasm
homepage :
	 https://www.tablix.org/~avian/blog/articles/z80dasm/
url :
	 https://www.tablix.org/~avian/z80dasm/z80dasm-1.1.5.tar.gz
description :
	 Disassembler for the Zilog Z80 microprocessor and compatibles
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
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
