name :
	 Libpcl
homepage :
	 http://xmailserver.org/libpcl.html
url :
	 http://xmailserver.org/pcl-1.12.tar.gz
description :
	 C library and API for coroutines
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
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
