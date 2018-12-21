name :
	 Libsigsegv
homepage :
	 https://www.gnu.org/software/libsigsegv/
url :
	 https://ftp.gnu.org/gnu/libsigsegv/libsigsegv-2.12.tar.gz
description :
	 Library for handling page faults in user mode
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-shared"
	 system "make"
	 system "make", "check"
	 system "make", "install"
