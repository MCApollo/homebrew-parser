name :
	 Libb2
homepage :
	 https://blake2.net/
url :
	 https://blake2.net/libb2-0.97.tar.gz
description :
	 Secure hashing function
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
	 "--disable-silent-rules",
	 "--enable-fat",
	 "--prefix=#{prefix}"
	 system "make", "install"
