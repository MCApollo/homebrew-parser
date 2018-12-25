name :
	 Opus
homepage :
	 https://www.opus-codec.org/
url :
	 https://archive.mozilla.org/pub/opus/opus-1.3.tar.gz
description :
	 Audio codec
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
	 args = ["--disable-dependency-tracking", "--disable-doc", "--prefix=#{prefix}"]
	 args << "--enable-custom-modes" if build.with? "custom-modes"
	 system "./autogen.sh" if build.head?
	 system "./configure", *args
	 system "make", "install"
