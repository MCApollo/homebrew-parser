name :
	 RiemannClient
homepage :
	 https://github.com/algernon/riemann-c-client
url :
	 https://github.com/algernon/riemann-c-client/archive/riemann-c-client-1.10.4.tar.gz
description :
	 C client library for the Riemann monitoring system
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 json-c
	 protobuf-c
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-i"
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "check"
	 system "make", "install"
