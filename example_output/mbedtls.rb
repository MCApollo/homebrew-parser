name :
	 Mbedtls
homepage :
	 https://tls.mbed.org/
url :
	 https://tls.mbed.org/download/mbedtls-2.13.0-apache.tgz
description :
	 Cryptographic & SSL/TLS library
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "include/mbedtls/config.h" do |s|
	 s.gsub! "//#define MBEDTLS_THREADING_PTHREAD", "#define MBEDTLS_THREADING_PTHREAD"
	 s.gsub! "//#define MBEDTLS_THREADING_C", "#define MBEDTLS_THREADING_C"
