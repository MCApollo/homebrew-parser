name :
	 Nasm
homepage :
	 https://www.nasm.us/
url :
	 https://www.nasm.us/pub/nasm/releasebuilds/2.14/nasm-2.14.tar.xz
description :
	 Netwide Assembler (NASM) is an 80x86 assembler
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "manpages" if build.head?
	 system "make", "rdf"
	 system "make", "install", "install_rdf"
