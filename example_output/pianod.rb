name :
	 Pianod
homepage :
	 https://deviousfish.com/pianod/
url :
	 https://deviousfish.com/Downloads/pianod/pianod-176.tar.gz
description :
	 Pandora client with multiple control interfaces
build_deps :
	 pkg-config
link_deps :
	 faad2
	 gnutls
	 json-c
	 libao
	 libgcrypt
	 mad
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
