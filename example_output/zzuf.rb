name :
	 Zzuf
homepage :
	 http://caca.zoy.org/wiki/zzuf
url :
	 https://github.com/samhocevar/zzuf/releases/download/v0.15/zzuf-0.15.tar.bz2
description :
	 Transparent application input fuzzer
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./bootstrap" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
