name :
	 Liblcf
homepage :
	 https://easyrpg.org/
url :
	 https://github.com/EasyRPG/liblcf/archive/0.5.4.tar.gz
description :
	 Library for RPG Maker 2000/2003 games data
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 expat
	 icu4c
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-i"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "check"
	 system "make", "install"
