name :
	 Libffi
homepage :
	 https://sourceware.org/libffi/
url :
	 https://sourceware.org/pub/libffi/libffi-3.2.1.tar.gz
description :
	 Portable Foreign Function Interface library
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
