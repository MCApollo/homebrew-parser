name :
	 Zyre
homepage :
	 https://github.com/zeromq/zyre
url :
	 https://github.com/zeromq/zyre/releases/download/v2.0.0/zyre-2.0.0.tar.gz
description :
	 Local Area Clustering for Peer-to-Peer Applications
build_deps :
	 pkg-config
link_deps :
	 czmq
	 zeromq
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "check-verbose"
	 system "make", "install"
