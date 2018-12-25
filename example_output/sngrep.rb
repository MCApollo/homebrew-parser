name :
	 Sngrep
homepage :
	 https://github.com/irontec/sngrep
url :
	 https://github.com/irontec/sngrep/archive/v1.4.6.tar.gz
description :
	 Command-line tool for displaying SIP calls message flows
build_deps :
	 autoconf
	 automake
link_deps :
	 ncurses
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./bootstrap.sh"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--with-openssl=#{Formula["openssl"].opt_prefix}"
	 system "make", "install"
