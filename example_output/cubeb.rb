name :
	 Cubeb
homepage :
	 https://github.com/kinetiknz/cubeb
url :
	 https://github.com/kinetiknz/cubeb/archive/cubeb-0.2.tar.gz
description :
	 Cross-platform audio library
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "--install"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
