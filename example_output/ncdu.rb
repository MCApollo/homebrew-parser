name :
	 Ncdu
homepage :
	 https://dev.yorhel.nl/ncdu
url :
	 https://dev.yorhel.nl/download/ncdu-1.13.tar.gz
description :
	 NCurses Disk Usage
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
	 system "autoreconf", "-i" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
