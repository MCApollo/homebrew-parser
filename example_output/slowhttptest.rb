name :
	 Slowhttptest
homepage :
	 https://github.com/shekyan/slowhttptest
url :
	 https://github.com/shekyan/slowhttptest/archive/v1.7.tar.gz
description :
	 Simulates application layer denial of service attacks
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
