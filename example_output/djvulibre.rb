name :
	 Djvulibre
homepage :
	 https://djvu.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/djvu/DjVuLibre/3.5.27/djvulibre-3.5.27.tar.gz
description :
	 DjVu viewer
build_deps :
link_deps :
	 jpeg
	 libtiff
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}", "--disable-desktopfiles"
	 system "make"
	 system "make", "install"
	 (share/"doc/djvu").install Dir["doc/*"]
