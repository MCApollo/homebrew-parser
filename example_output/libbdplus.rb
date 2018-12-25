name :
	 Libbdplus
homepage :
	 https://www.videolan.org/developers/libbdplus.html
url :
	 https://download.videolan.org/pub/videolan/libbdplus/0.1.2/libbdplus-0.1.2.tar.bz2
description :
	 Implements the BD+ System Specifications
build_deps :
link_deps :
	 libgcrypt
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./bootstrap" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
