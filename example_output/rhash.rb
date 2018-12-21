name :
	 Rhash
homepage :
	 https://sourceforge.net/projects/rhash/
url :
	 https://downloads.sourceforge.net/project/rhash/rhash/1.3.6/rhash-1.3.6-src.tar.gz
description :
	 Utility for computing and verifying hash sums of files
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
	 lib.install "librhash/librhash.dylib"
	 system "make", "-C", "librhash", "install-headers"
