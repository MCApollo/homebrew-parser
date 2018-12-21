name :
	 Libkate
homepage :
	 https://code.google.com/archive/p/libkate/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/libkate/libkate-0.4.1.tar.gz
description :
	 Overlay codec for multiplexed audio/video in Ogg
build_deps :
	 pkg-config
link_deps :
	 libogg
	 libpng
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--enable-shared",
	 "--enable-static",
	 "--prefix=#{prefix}"
	 system "make", "check"
	 system "make", "install"
