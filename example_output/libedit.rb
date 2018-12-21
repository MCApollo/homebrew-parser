name :
	 Libedit
homepage :
	 https://thrysoee.dk/editline/
url :
	 https://thrysoee.dk/editline/libedit-20181209-3.1.tar.gz
description :
	 BSD-style licensed readline alternative
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
