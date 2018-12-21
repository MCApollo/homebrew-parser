name :
	 Minidjvu
homepage :
	 https://minidjvu.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/minidjvu/minidjvu/0.8/minidjvu-0.8.tar.gz
description :
	 DjVu multipage encoder, single page encoder/decoder
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 djvulibre
	 libtiff
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "autoreconf", "-vfi"
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
	 lib.install Dir["#{prefix}/*.dylib"]
