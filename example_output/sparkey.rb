name :
	 Sparkey
homepage :
	 https://github.com/spotify/sparkey/
url :
	 https://github.com/spotify/sparkey/archive/sparkey-1.0.0.tar.gz
description :
	 Constant key-value store, best for frequent read/infrequent write uses
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 snappy
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "--install"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
