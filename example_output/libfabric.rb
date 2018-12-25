name :
	 Libfabric
homepage :
	 https://ofiwg.github.io/libfabric/
url :
	 https://github.com/ofiwg/libfabric/releases/download/v1.6.2/libfabric-1.6.2.tar.bz2
description :
	 OpenFabrics libfabric
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
