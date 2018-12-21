name :
	 Opensc
homepage :
	 https://github.com/OpenSC/OpenSC/wiki
url :
	 https://github.com/OpenSC/OpenSC/releases/download/0.19.0/opensc-0.19.0.tar.gz
description :
	 Tools and libraries for smart cards
build_deps :
	 autoconf
	 automake
	 docbook-xsl
	 libtool
	 pkg-config
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --enable-openssl
	 --enable-pcsc
	 --enable-sm
	 --with-xsl-stylesheetsdir=#{Formula["docbook-xsl"].opt_prefix}/docbook-xsl
	 ]
	 system "./bootstrap"
	 system "./configure", *args
	 system "make", "install"
