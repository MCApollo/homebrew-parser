name :
	 Librdkafka
homepage :
	 https://github.com/edenhill/librdkafka
url :
	 https://github.com/edenhill/librdkafka/archive/v0.11.6.tar.gz
description :
	 The Apache Kafka C/C++ library
build_deps :
	 pkg-config
link_deps :
	 lz4
	 lzlib
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
