name :
	 X3270
homepage :
	 http://x3270.bgp.nu/
url :
	 https://downloads.sourceforge.net/project/x3270/x3270/3.6ga5/suite3270-3.6ga5-src.tgz
description :
	 IBM 3270 terminal emulator for the X Window System and Windows
build_deps :
link_deps :
	 openssl
optional_deps :
	 :x11
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --enable-c3270
	 --enable-pr3287
	 --enable-s3270
	 --enable-tcl3270
	 ]
	 args << "--enable-x3270" if build.with? "x11"
	 system "./configure", *args
	 system "make", "install"
	 system "make", "install.man"
