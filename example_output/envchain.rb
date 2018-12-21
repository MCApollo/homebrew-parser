name :
	 Envchain
homepage :
	 https://github.com/sorah/envchain
url :
	 https://github.com/sorah/envchain/archive/v1.0.1.tar.gz
description :
	 Secure your credentials in environment variables
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "DESTDIR=#{prefix}", "install"
