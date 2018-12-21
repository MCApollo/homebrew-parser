name :
	 Redex
homepage :
	 https://fbredex.com
url :
	 https://github.com/facebook/redex/archive/v2017.10.31.tar.gz
description :
	 Bytecode optimizer for Android apps
build_deps :
	 autoconf
	 automake
	 libevent
	 libtool
link_deps :
	 boost
	 jsoncpp
	 python
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-ivf"
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
