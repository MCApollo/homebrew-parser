name :
	 Libunistring
homepage :
	 https://www.gnu.org/software/libunistring/
url :
	 https://ftp.gnu.org/gnu/libunistring/libunistring-0.9.10.tar.xz
description :
	 C string library for manipulating Unicode strings
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
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "check"
	 system "make", "install"
