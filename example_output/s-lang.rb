name :
	 SLang
homepage :
	 https://www.jedsoft.org/slang/
url :
	 https://www.jedsoft.org/releases/slang/slang-2.3.1a.tar.bz2
description :
	 Library for creating multi-platform software
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
	 png = Formula["libpng"]
	 system "./configure", "--prefix=#{prefix}",
	 "--with-pnglib=#{png.lib}",
	 "--with-pnginc=#{png.include}"
	 ENV.deparallelize
	 system "make"
	 system "make", "install"
