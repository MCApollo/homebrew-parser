name :
	 Shivavg
homepage :
	 https://sourceforge.net/projects/shivavg/
url :
	 https://downloads.sourceforge.net/project/shivavg/ShivaVG/0.2.1/ShivaVG-0.2.1.zip
description :
	 OpenGL based ANSI C implementation of the OpenVG standard
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "/bin/sh", "autogen.sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-example-all=no"
	 system "make", "install"
