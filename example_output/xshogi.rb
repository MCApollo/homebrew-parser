name :
	 Xshogi
homepage :
	 https://www.gnu.org/software/gnushogi/
url :
	 https://ftp.gnu.org/gnu/gnushogi/xshogi-1.4.2.tar.gz
description :
	 X11 interface for GNU Shogi
build_deps :
link_deps :
	 gnu-shogi
	 :x11
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking"
	 system "make", "install"
