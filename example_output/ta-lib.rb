name :
	 TaLib
homepage :
	 https://ta-lib.org/
url :
	 https://downloads.sourceforge.net/project/ta-lib/ta-lib/0.4.0/ta-lib-0.4.0-src.tar.gz
description :
	 Tools for market analysis
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 bin.install "src/tools/ta_regtest/.libs/ta_regtest"
