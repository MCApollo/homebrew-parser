name :
	 Freetype
homepage :
	 https://www.freetype.org/
url :
	 https://downloads.sourceforge.net/project/freetype/freetype2/2.9.1/freetype-2.9.1.tar.bz2
description :
	 Software library to render fonts
build_deps :
link_deps :
	 libpng
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--enable-freetype-config",
	 "--without-harfbuzz"
	 system "make"
	 system "make", "install"
	 inreplace [bin/"freetype-config", lib/"pkgconfig/freetype2.pc"],
	 prefix, opt_prefix
