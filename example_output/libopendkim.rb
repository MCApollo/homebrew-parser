name :
	 Libopendkim
homepage :
	 http://opendkim.org
url :
	 https://downloads.sourceforge.net/project/opendkim/opendkim-2.10.3.tar.gz
description :
	 Implementation of Domain Keys Identified Mail authentication
build_deps :
link_deps :
	 openssl
	 unbound
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--disable-filter",
	 "--with-unbound=#{Formula["unbound"].opt_prefix}",
	 "--with-openssl=#{Formula["openssl"].opt_prefix}"
	 system "make", "install"
