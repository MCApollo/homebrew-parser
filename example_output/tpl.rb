name :
	 Tpl
homepage :
	 https://troydhanson.github.io/tpl/
url :
	 https://github.com/troydhanson/tpl/archive/v1.6.1.tar.gz
description :
	 Store and retrieve binary data in C
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-fvi"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 system "make", "-C", "tests"
