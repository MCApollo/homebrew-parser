name :
	 Hesiod
homepage :
	 https://github.com/achernya/hesiod
url :
	 https://github.com/achernya/hesiod/archive/hesiod-3.2.1.tar.gz
description :
	 Library for the simple string lookup service built on top of DNS
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 libidn
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-fvi"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
