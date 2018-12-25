name :
	 Txr
homepage :
	 https://www.nongnu.org/txr/
url :
	 http://www.kylheku.com/cgit/txr/snapshot/txr-198.tar.bz2
description :
	 Original, new programming language for convenient data munging
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
