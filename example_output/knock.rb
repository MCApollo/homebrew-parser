name :
	 Knock
homepage :
	 http://www.zeroflux.org/projects/knock
url :
	 http://www.zeroflux.org/proj/knock/files/knock-0.7.tar.gz
description :
	 Port-knock server
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-fi" if build.head?
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
