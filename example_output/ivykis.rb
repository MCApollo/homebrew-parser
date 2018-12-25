name :
	 Ivykis
homepage :
	 https://sourceforge.net/projects/libivykis
url :
	 https://downloads.sourceforge.net/project/libivykis/0.42.3/ivykis-0.42.3.tar.gz
description :
	 Async I/O-assisting library
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
	 system "autoreconf", "-i"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
