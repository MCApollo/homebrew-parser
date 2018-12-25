name :
	 Toilet
homepage :
	 http://caca.zoy.org/wiki/toilet
url :
	 http://caca.zoy.org/raw-attachment/wiki/toilet/toilet-0.3.tar.gz
description :
	 Color-based alternative to figlet (uses libcaca)
build_deps :
	 pkg-config
link_deps :
	 libcaca
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
