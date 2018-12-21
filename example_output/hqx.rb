name :
	 Hqx
homepage :
	 https://code.google.com/archive/p/hqx/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/hqx/hqx-1.1.tar.gz
description :
	 Magnification filter designed for pixel art
build_deps :
link_deps :
	 devil
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
