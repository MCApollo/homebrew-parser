name :
	 Guichan
homepage :
	 https://guichan.sourceforge.io/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/guichan/guichan-0.8.2.tar.gz
description :
	 Small, efficient C++ GUI library designed for games
build_deps :
link_deps :
	 sdl_image
conflicts :
patches :
EOF_patch :
install :
	 ENV.append "CPPFLAGS", "-I#{Formula["sdl_image"].opt_include}/SDL"
	 ENV.append "LDFLAGS", "-lSDL -lSDL_image -framework OpenGL"
	 inreplace "src/opengl/Makefile.in", "-no-undefined", " "
	 inreplace "src/sdl/Makefile.in", "-no-undefined", " "
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
