name :
	 Wslay
homepage :
	 https://wslay.sourceforge.io/
url :
	 https://github.com/tatsuhiro-t/wslay/releases/download/release-1.1.0/wslay-1.1.0.tar.xz
description :
	 C websocket library
build_deps :
	 cunit
	 pkg-config
	 sphinx-doc
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fvi" if build.head?
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules"
	 system "make", "check"
	 system "make", "install"
