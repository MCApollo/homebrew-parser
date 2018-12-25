name :
	 W3m
homepage :
	 https://w3m.sourceforge.io/
url :
description :
	 Pager/text based browser
build_deps :
	 pkg-config
link_deps :
	 bdw-gc
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-image",
	 "--with-ssl=#{Formula["openssl"].opt_prefix}"
	 system "make", "install"
