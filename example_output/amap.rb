name :
	 Amap
homepage :
	 https://www.thc.org/thc-amap/
url :
	 https://www.thc.org/releases/amap-5.4.tar.gz
description :
	 Perform application protocol detection
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 openssl = Formula["openssl"]
	 inreplace "configure" do |s|
	 s.gsub! 'SSL_IPATH=""', "SSL_IPATH=\"#{openssl.opt_include}/openssl\""
	 s.gsub! 'SSL_PATH=""', "SSL_PATH=\"#{openssl.opt_lib}\""
	 s.gsub! 'CRYPTO_PATH=""', "CRYPTO_PATH=\"#{openssl.opt_lib}\""
