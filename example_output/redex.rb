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
optional_deps :
conflicts :
resource :
	 ['test_apk']
	 ['https://raw.githubusercontent.com/facebook/redex/fa32d542d4074dbd485584413d69ea0c9c3cbc98/test/instr/redex-test.apk']
patches :
EOF_patch :
install :
	 system "autoreconf", "-ivf"
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
