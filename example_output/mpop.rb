name :
	 Mpop
homepage :
	 https://marlam.de/mpop/
url :
	 https://marlam.de/mpop/releases/mpop-1.2.8.tar.xz
description :
	 POP3 client
build_deps :
	 pkg-config
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
	 system "make", "install"
