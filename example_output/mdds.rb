name :
	 Mdds
homepage :
	 https://gitlab.com/mdds/mdds
url :
	 https://kohei.us/files/mdds/src/mdds-1.4.2.tar.bz2
description :
	 Multi-dimensional data structure and indexing algorithm
build_deps :
	 autoconf
link_deps :
	 boost
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "configure.ac", "$CPPFLAGS -I/usr/include -I/usr/local/include",
	 "$CPPFLAGS -I/usr/local/include"
	 system "autoconf"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
