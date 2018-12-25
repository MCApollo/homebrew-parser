name :
	 Ncdc
homepage :
	 https://dev.yorhel.nl/ncdc
url :
	 https://dev.yorhel.nl/download/ncdc-1.20.tar.gz
description :
	 NCurses direct connect
build_deps :
	 pkg-config
link_deps :
	 glib
	 gnutls
	 sqlite
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-ivf" if build.head?
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
