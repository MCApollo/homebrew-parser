name :
	 Sqtop
homepage :
	 https://github.com/paleg/sqtop
url :
	 https://github.com/paleg/sqtop/archive/v2015-02-08.tar.gz
description :
	 Display information about active connections for a Squid proxy
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
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
