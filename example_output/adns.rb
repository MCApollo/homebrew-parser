name :
	 Adns
homepage :
	 https://www.chiark.greenend.org.uk/~ian/adns/
url :
	 https://www.chiark.greenend.org.uk/~ian/adns/ftp/adns-1.5.1.tar.gz
description :
	 C/C++ resolver library and DNS resolver utilities
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
	 system "./configure", "--prefix=#{prefix}", "--disable-dynamic"
	 system "make"
	 system "make", "install"
