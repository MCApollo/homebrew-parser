name :
	 Lightning
homepage :
	 https://www.gnu.org/software/lightning/
url :
	 https://ftp.gnu.org/gnu/lightning/lightning-2.1.2.tar.gz
description :
	 Generates assembly language code at run-time
build_deps :
	 binutils
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules", "--prefix=#{prefix}"
	 system "make", "check", "-j1"
	 system "make", "install"
