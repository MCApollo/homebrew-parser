name :
	 Liblqr
homepage :
	 https://liblqr.wikidot.com/
url :
	 https://liblqr.wdfiles.com/local--files/en:download-page/liblqr-1-0.4.2.tar.bz2
description :
	 C/C++ seam carving library
build_deps :
	 pkg-config
link_deps :
	 glib
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
