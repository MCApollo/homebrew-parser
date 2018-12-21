name :
	 Gqlplus
homepage :
	 https://gqlplus.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/gqlplus/gqlplus/1.16/gqlplus-1.16.tar.gz
description :
	 Drop-in replacement for sqlplus, an Oracle SQL client
build_deps :
link_deps :
	 readline
conflicts :
patches :
EOF_patch :
install :
	 inreplace "gqlplus.c",
	 "#define VERSION          \"1.15\"",
	 "#define VERSION          \"1.16\""
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
