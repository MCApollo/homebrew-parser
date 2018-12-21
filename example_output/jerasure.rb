name :
	 Jerasure
homepage :
	 http://jerasure.org/
url :
	 https://bitbucket.org/tsg-/jerasure/get/v2.0.0.tar.bz2
description :
	 Library in C that supports erasure coding in storage applications
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 gf-complete
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "--force", "--install"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
