name :
	 Libuninameslist
homepage :
	 https://github.com/fontforge/libuninameslist
url :
	 https://github.com/fontforge/libuninameslist/releases/download/20180701/libuninameslist-dist-20180701.tar.gz
description :
	 Library of Unicode names and annotation data
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 system "autoreconf", "-i"
	 system "automake"
	 end
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
