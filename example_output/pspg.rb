name :
	 Pspg
homepage :
	 https://github.com/okbob/pspg
url :
	 https://github.com/okbob/pspg/archive/1.6.3.tar.gz
description :
	 Unix pager optimized for psql
build_deps :
link_deps :
	 ncurses
	 readline
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--prefix=#{prefix}"
	 system "make", "install"
