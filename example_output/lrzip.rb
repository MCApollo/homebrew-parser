name :
	 Lrzip
homepage :
	 http://lrzip.kolivas.org
url :
	 http://ck.kolivas.org/apps/lrzip/lrzip-0.631.tar.bz2
description :
	 Compression program with a very high compression ratio
build_deps :
	 pkg-config
link_deps :
	 lzo
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
	 system "make"
	 system "make", "install"
