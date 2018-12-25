name :
	 Libopkele
homepage :
	 http://kin.klever.net/libopkele/
url :
	 http://kin.klever.net/dist/libopkele-2.0.4.tar.bz2
description :
	 C++ implementation of OpenID decentralized identity system
build_deps :
	 doxygen
	 pkg-config
link_deps :
	 boost
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/hacker/libopkele/commit/9ff6244998b0d41e71f7cc7351403ad590e990e4.diff?full_index=1
EOF_patch :
install :
	 system "./autogen.bash" if build.head?
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 system "make", "dox"
	 doc.install "doxydox/html"
