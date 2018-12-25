name :
	 Libmicrohttpd
homepage :
	 https://www.gnu.org/software/libmicrohttpd/
url :
	 https://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-0.9.59.tar.gz
description :
	 Light HTTP/1.1 server library
build_deps :
link_deps :
	 libgcrypt
	 gnutls
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
	 system "make", "install"
	 pkgshare.install "doc/examples"
