name :
	 Libagar
homepage :
	 http://libagar.org/
url :
	 http://stable.hypertriton.com/agar/agar-1.5.0.tar.gz
description :
	 Cross-platform GUI toolkit
build_deps :
link_deps :
	 freetype
	 jpeg
	 libpng
	 sdl
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install", "MANDIR=
