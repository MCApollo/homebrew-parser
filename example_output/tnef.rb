name :
	 Tnef
homepage :
	 https://github.com/verdammelt/tnef
url :
	 https://github.com/verdammelt/tnef/archive/1.4.17.tar.gz
description :
	 Microsoft MS-TNEF attachment unpacker
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-i"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
