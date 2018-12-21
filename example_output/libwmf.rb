name :
	 Libwmf
homepage :
	 https://wvware.sourceforge.io/libwmf.html
url :
	 https://downloads.sourceforge.net/project/wvware/libwmf/0.2.8.4/libwmf-0.2.8.4.tar.gz
description :
	 Library for converting WMF (Window Metafile Format) files
build_deps :
	 pkg-config
link_deps :
	 freetype
	 gd
	 jpeg
	 libpng
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-png=#{Formula["libpng"].opt_prefix}",
	 "--with-freetype=#{Formula["freetype"].opt_prefix}"
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
