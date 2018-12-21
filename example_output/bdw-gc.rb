name :
	 BdwGc
homepage :
	 https://www.hboehm.info/gc/
url :
	 https://github.com/ivmai/bdwgc/releases/download/v8.0.0/gc-8.0.0.tar.gz
description :
	 Garbage collector for C and C++
build_deps :
	 libatomic_ops
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-cplusplus"
	 system "make"
	 system "make", "check"
	 system "make", "install"
