name :
	 Heimdal
homepage :
	 https://www.h5l.org
url :
	 https://github.com/heimdal/heimdal/releases/download/heimdal-7.5.0/heimdal-7.5.0.tar.gz
description :
	 Free Kerberos 5 implementation
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --without-x
	 ]
	 system "./configure", *args
	 system "make", "install"
