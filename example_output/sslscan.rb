name :
	 Sslscan
homepage :
	 https://github.com/rbsec/sslscan
url :
	 https://github.com/rbsec/sslscan/archive/1.11.12-rbsec.tar.gz
description :
	 Test SSL/TLS enabled services to discover supported cipher suites
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['insecure-openssl']
	 ['https://github.com/openssl/openssl/archive/OpenSSL_1_0_2f.tar.gz']
patches :
EOF_patch :
install :
	 (buildpath/"openssl").install resource("insecure-openssl")
	 inreplace "Makefile", "openssl/Makefile: .openssl.is.fresh",
	 "openssl/Makefile:"
	 ENV.deparallelize do
	 system "make", "static"
	 end
	 system "make", "install", "PREFIX=#{prefix}"
