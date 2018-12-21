name :
	 Minizip
homepage :
	 https://www.winimage.com/zLibDll/minizip.html
url :
	 https://zlib.net/zlib-1.2.11.tar.gz
description :
	 C library for zip/unzip via zLib
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 cd "contrib/minizip" do
	 inreplace "Makefile.am" do |s|
	 s.sub! "-L$(zlib_top_builddir)", "$(zlib_top_builddir)/libz.a"
	 s.sub! "-version-info 1:0:0 -lz", "-version-info 1:0:0"
	 s.sub! "libminizip.la -lz", "libminizip.la"
