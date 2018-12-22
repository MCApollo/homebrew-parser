name :
	 ConfluentOss
homepage :
	 https://www.confluent.io/product/confluent-open-source/
url :
	 https://packages.confluent.io/archive/5.0/confluent-oss-5.0.1-2.11.tar.gz
description :
	 Developer-optimized distribution of Apache Kafka
build_deps :
link_deps :
	 :java
conflicts :
	 kafka
patches :
EOF_patch :
install :
	 prefix.install "bin"
	 rm_rf "#{bin}/windows"
	 prefix.install "etc"
	 prefix.install "share"
