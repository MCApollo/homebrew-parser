name :
	 Libltc
homepage :
	 https://x42.github.io/libltc/
url :
	 https://github.com/x42/libltc/releases/download/v1.3.0/libltc-1.3.0.tar.gz
description :
	 POSIX-C Library for handling Linear/Logitudinal Time Code (LTC)
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
