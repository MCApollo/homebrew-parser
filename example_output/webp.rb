name :
	 Webp
homepage :
	 https://developers.google.com/speed/webp/
url :
	 https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.0.1.tar.gz
description :
	 Image format providing lossless and lossy compression for web images
build_deps :
link_deps :
	 jpeg
	 libpng
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking",
	 "--disable-gif",
	 "--disable-gl",
	 "--enable-libwebpdecoder",
	 "--enable-libwebpdemux",
	 "--enable-libwebpmux"
	 system "make", "install"
