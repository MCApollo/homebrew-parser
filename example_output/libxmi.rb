name :
	 Libxmi
homepage :
	 https://www.gnu.org/software/libxmi/
url :
	 https://ftp.gnu.org/gnu/libxmi/libxmi-1.2.tar.gz
description :
	 C/C++ function library for rasterizing 2D vector graphics
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
	 "--prefix=#{prefix}", "--infodir=#{info}"
	 system "make", "install"
