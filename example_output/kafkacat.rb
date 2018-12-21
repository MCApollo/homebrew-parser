name :
	 Kafkacat
homepage :
	 https://github.com/edenhill/kafkacat
url :
	 https://github.com/edenhill/kafkacat.git
description :
	 Generic command-line non-JVM Apache Kafka producer and consumer
build_deps :
link_deps :
	 librdkafka
	 yajl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-json"
	 system "make"
	 system "make", "install"
