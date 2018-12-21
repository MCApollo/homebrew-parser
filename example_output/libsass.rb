name :
	 Libsass
homepage :
	 https://github.com/sass/libsass
url :
	 https://github.com/sass/libsass.git
description :
	 C implementation of a Sass compiler
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "autoreconf", "-fvi"
	 system "./configure", "--prefix=#{prefix}", "--disable-silent-rules",
	 "--disable-dependency-tracking"
	 system "make", "install"
