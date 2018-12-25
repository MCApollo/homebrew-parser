name :
	 Libopusenc
homepage :
	 https://opus-codec.org/
url :
	 https://archive.mozilla.org/pub/opus/libopusenc-0.2.1.tar.gz
description :
	 Convenience libraray for creating .opus files
build_deps :
	 pkg-config
link_deps :
	 opus
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
