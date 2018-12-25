name :
	 Ftgl
homepage :
	 https://sourceforge.net/projects/ftgl/
url :
	 https://downloads.sourceforge.net/project/ftgl/FTGL%20Source/2.1.3~rc5/ftgl-2.1.3-rc5.tar.gz
description :
	 Freetype / OpenGL bridge
build_deps :
link_deps :
	 freetype
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "configure", "set dummy doxygen;", "set dummy no_doxygen;"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-freetypetest",
	 "--with-glut-inc=/dev/null",
	 "--with-glut-lib=/dev/null"
	 system "make", "install"
	 end
