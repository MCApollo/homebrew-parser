name :
	 Synscan
homepage :
	 http://www.digit-labs.org/files/tools/synscan/
url :
	 http://www.digit-labs.org/files/tools/synscan/releases/synscan-5.02.tar.gz
description :
	 Asynchronous half-open TCP portscanner
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "macos"
	 system "make", "install"
