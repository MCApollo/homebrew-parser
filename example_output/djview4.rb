name :
	 Djview4
homepage :
	 https://djvu.sourceforge.io/djview4.html
url :
	 https://downloads.sourceforge.net/project/djvu/DjView/4.10/djview-4.10.6.tar.gz
description :
	 Viewer for the DjVu image format
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 djvulibre
	 qt
conflicts :
patches :
EOF_patch :
install :
	 inreplace "src/djview.pro", "10.6", MacOS.version
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-debug",
	 "--prefix=#{prefix}",
	 "--with-x=no",
	 "--disable-nsdejavu",
	 "--disable-desktopfiles"
	 system "make", "CC=#{ENV.cc}", "CXX=#{ENV.cxx}"
	 prefix.install "src/djview.app"
