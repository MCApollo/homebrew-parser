name :
	 Bro
homepage :
	 https://www.bro.org
url :
	 https://www.bro.org/downloads/bro-2.5.5.tar.gz
description :
	 Network security monitor
build_deps :
	 cmake
	 swig
link_deps :
	 geoip
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--with-openssl=#{Formula["openssl"].opt_prefix}",
	 "--localstatedir=#{var}",
	 "--conf-files-dir=#{etc}"
	 system "make", "install"
