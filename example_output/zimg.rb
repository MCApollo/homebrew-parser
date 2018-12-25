name :
	 Zimg
homepage :
	 https://github.com/sekrit-twc/zimg
url :
	 https://github.com/sekrit-twc/zimg/archive/release-2.8.tar.gz
description :
	 Scaling, colorspace conversion, and dithering library
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 :macos
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
