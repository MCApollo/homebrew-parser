name :
	 Skktools
homepage :
	 http://openlab.jp/skk/index-j.html
url :
	 https://deb.debian.org/debian/pool/main/s/skktools/skktools_1.3.4.orig.tar.gz
description :
	 SKK dictionary maintenance tools
build_deps :
	 pkg-config
link_deps :
	 glib
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--with-skkdic-expr2"
	 system "make", "CC=#{ENV.cc}"
	 ENV.deparallelize
	 system "make", "install"
