name :
	 Wavpack
homepage :
	 http://www.wavpack.com/
url :
	 http://www.wavpack.com/wavpack-5.1.0.tar.bz2
description :
	 Hybrid lossless audio compression
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 args = %W[--prefix=#{prefix} --disable-dependency-tracking]
	 if build.head?
	 system "./autogen.sh", *args
	 else
	 system "./configure", *args
	 end
	 system "make", "install"
