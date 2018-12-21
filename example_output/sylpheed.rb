name :
	 Sylpheed
homepage :
	 https://sylpheed.sraoss.jp/en/
url :
	 https://sylpheed.sraoss.jp/sylpheed/v3.7/sylpheed-3.7.0.tar.bz2
description :
	 Simple, lightweight email-client
build_deps :
	 pkg-config
link_deps :
	 gpgme
	 gtk+
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-updatecheck"
	 system "make", "install"
