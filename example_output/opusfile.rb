name :
	 Opusfile
homepage :
	 https://www.opus-codec.org/
url :
	 https://archive.mozilla.org/pub/opus/opusfile-0.11.tar.gz
description :
	 API for decoding and seeking in .opus files
build_deps :
	 pkg-config
link_deps :
	 libogg
	 openssl
	 opus
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
