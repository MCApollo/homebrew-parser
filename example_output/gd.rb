name :
	 Gd
homepage :
	 https://libgd.github.io/
url :
	 https://github.com/libgd/libgd/releases/download/gd-2.2.5/libgd-2.2.5.tar.xz
description :
	 Graphics library to dynamically manipulate images
build_deps :
link_deps :
	 fontconfig
	 freetype
	 jpeg
	 libpng
	 libtiff
	 webp
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./bootstrap.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-freetype=#{Formula["freetype"].opt_prefix}",
	 "--with-png=#{Formula["libpng"].opt_prefix}",
	 "--without-x",
	 "--without-xpm"
	 system "make", "install"
