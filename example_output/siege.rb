name :
	 Siege
homepage :
	 https://www.joedog.org/siege-home/
url :
	 http://download.joedog.org/siege/siege-4.0.4.tar.gz
description :
	 HTTP regression testing and benchmarking utility
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 (prefix/"etc").mkdir
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--localstatedir=#{var}",
	 "--with-ssl=#{Formula["openssl"].opt_prefix}"
	 system "make", "install"
