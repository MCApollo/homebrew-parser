name :
	 Iprint
homepage :
	 https://www.samba.org/ftp/unpacked/junkcode/i.c
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/i/iprint/iprint_1.3.orig.tar.gz
description :
	 Provides a print_one function
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/i/iprint/iprint_1.3-9.diff.gz
EOF_patch :
install :
	 system "make"
	 bin.install "i"
	 man1.install "i.1"
