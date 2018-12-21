name :
	 Libgadu
homepage :
	 http://libgadu.net/
url :
	 https://github.com/wojtekka/libgadu/releases/download/1.12.2/libgadu-1.12.2.tar.gz
description :
	 Library for ICQ instant messenger protocol
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--without-pthread"
	 system "make", "install"
