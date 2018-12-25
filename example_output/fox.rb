name :
	 Fox
homepage :
	 http://www.fox-toolkit.org/
url :
	 http://fox-toolkit.org/ftp/fox-1.6.56.tar.gz
description :
	 Toolkit for developing Graphical User Interfaces easily
build_deps :
link_deps :
	 fontconfig
	 freetype
	 jpeg
	 libpng
	 libtiff
	 :x11
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--enable-release",
	 "--prefix=#{prefix}",
	 "--with-x",
	 "--with-opengl"
	 system "make", "install", "LDFLAGS="
	 rm bin/"Adie.stx"
