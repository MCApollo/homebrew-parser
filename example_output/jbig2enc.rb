name :
	 Jbig2enc
homepage :
	 https://github.com/agl/jbig2enc
url :
	 https://github.com/agl/jbig2enc/archive/0.29.tar.gz
description :
	 JBIG2 encoder (for monochrome documents)
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 leptonica
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
