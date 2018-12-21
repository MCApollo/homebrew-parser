name :
	 Cmockery2
homepage :
	 https://github.com/lpabon/cmockery2
url :
	 https://github.com/lpabon/cmockery2/archive/v1.3.9.tar.gz
description :
	 Reviving cmockery unit test framework from Google
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
	 system "./autogen.sh"
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
	 (share+"example").install "src/example/calculator.c"
