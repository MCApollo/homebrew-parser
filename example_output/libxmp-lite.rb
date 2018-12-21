name :
	 LibxmpLite
homepage :
	 https://xmp.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/xmp/libxmp/4.4.1/libxmp-lite-4.4.1.tar.gz
description :
	 Lite libxmp
build_deps :
link_deps :
conflicts :
patches :
	 https://github.com/cmatsuoka/libxmp/commit/a028835.patch?full_index=1
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
