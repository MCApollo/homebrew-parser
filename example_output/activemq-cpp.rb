name :
	 ActivemqCpp
homepage :
	 https://activemq.apache.org/cms/index.html
url :
	 https://www.apache.org/dyn/closer.cgi?path=activemq/activemq-cpp/3.9.4/activemq-cpp-library-3.9.4-src.tar.bz2
description :
	 C++ API for message brokers such as Apache ActiveMQ
build_deps :
	 pkg-config
link_deps :
	 apr
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
