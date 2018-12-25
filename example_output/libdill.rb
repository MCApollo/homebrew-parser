name :
	 Libdill
homepage :
	 http://libdill.org/
url :
	 https://github.com/sustrik/libdill/archive/2.13.tar.gz
description :
	 Structured concurrency in C
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
