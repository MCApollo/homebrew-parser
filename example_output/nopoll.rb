name :
	 Nopoll
homepage :
	 https://www.aspl.es/nopoll/
url :
	 https://www.aspl.es/nopoll/downloads/nopoll-0.4.6.b400.tar.gz
description :
	 Open-source C WebSocket toolkit
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
