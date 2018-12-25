name :
	 Libtrace
homepage :
	 https://research.wand.net.nz/software/libtrace.php
url :
	 https://research.wand.net.nz/software/libtrace/libtrace-4.0.4.tar.bz2
description :
	 Library for trace processing supporting multiple inputs
build_deps :
link_deps :
	 openssl
	 wandio
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
