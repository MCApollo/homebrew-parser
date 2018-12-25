name :
	 Logstash
homepage :
	 https://www.elastic.co/products/logstash
url :
	 https://artifacts.elastic.co/downloads/logstash/logstash-oss-6.5.2.tar.gz
description :
	 Tool for managing events and logs
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ln_s etc/"logstash", libexec/"config"
