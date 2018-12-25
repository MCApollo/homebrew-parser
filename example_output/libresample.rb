name :
	 Libresample
homepage :
	 https://ccrma.stanford.edu/~jos/resample/Available_Software.html
url :
	 https://mirrorservice.org/sites/ftp.debian.org/debian/pool/main/libr/libresample/libresample_0.1.3.orig.tar.gz
description :
	 Audio resampling C library
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
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 lib.install "libresample.a"
	 include.install "include/libresample.h"
