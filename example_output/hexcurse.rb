name :
	 Hexcurse
homepage :
	 https://github.com/LonnyGomes/hexcurse
url :
	 https://github.com/LonnyGomes/hexcurse/archive/v1.60.0.tar.gz
description :
	 Ncurses-based console hex editor
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
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
