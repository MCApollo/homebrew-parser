name :
	 Megatools
homepage :
	 https://megatools.megous.com/
url :
	 https://megatools.megous.com/builds/megatools-1.10.2.tar.gz
description :
	 Command-line client for Mega.co.nz
build_deps :
	 asciidoc
	 pkg-config
link_deps :
	 glib
	 glib-networking
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
