name :
	 Z80asm
homepage :
	 https://www.nongnu.org/z80asm/
url :
	 https://download.savannah.gnu.org/releases/z80asm/z80asm-1.8.tar.gz
description :
	 Assembler for the Zilog Z80 microprcessor and compatibles
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
	 bin.install "z80asm"
	 man1.install "z80asm.1"
