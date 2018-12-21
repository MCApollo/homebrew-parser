name :
	 Udis86
homepage :
	 https://udis86.sourceforge.io
url :
	 https://downloads.sourceforge.net/udis86/udis86-1.7.2.tar.gz
description :
	 Minimalistic disassembler library for x86
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--enable-shared"
	 system "make"
	 system "make", "install"
