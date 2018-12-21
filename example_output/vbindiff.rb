name :
	 Vbindiff
homepage :
	 https://www.cjmweb.net/vbindiff/
url :
	 https://www.cjmweb.net/vbindiff/vbindiff-3.0_beta5.tar.gz
description :
	 Visual Binary Diff
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
