name :
	 KibanaAT56
homepage :
	 https://www.elastic.co/products/kibana
url :
	 https://github.com/elastic/kibana.git
description :
	 Analytics and search dashboard for Elasticsearch
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 resource("node").stage do
	 system "./configure", "--prefix=#{libexec}/node"
	 system "make", "install"
	 ln_s etc/"kibana", prefix/"config"
	 (prefix/"data").mkdir
	 (prefix/"plugins").mkdir
