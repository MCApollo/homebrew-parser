name :
	 Libosip
homepage :
	 https://www.gnu.org/software/osip/
url :
	 https://ftp.gnu.org/gnu/osip/libosip2-5.0.0.tar.gz
description :
	 Implementation of the eXosip2 stack
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
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
