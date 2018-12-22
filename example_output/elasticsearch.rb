name :
	 Elasticsearch
homepage :
	 https://www.elastic.co/products/elasticsearch
url :
	 https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.5.2.tar.gz
description :
	 Distributed search & analytics engine
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 system "gradle", "clean", ":distribution:tar:assemble"
	 mkdir "tar"
	 cd "tar"
	 system "tar", "--strip-components=1", "-xf", Dir["../distribution/tar/build/distributions/elasticsearch-*.tar.gz"].first
	 (var/"lib/elasticsearch/#{cluster_name}").mkpath
	 (var/"log/elasticsearch").mkpath
	 ln_s etc/"elasticsearch", libexec/"config"
	 (var/"elasticsearch/plugins").mkpath
	 ln_s var/"elasticsearch/plugins", libexec/"plugins"
	 system bin/"elasticsearch-keystore", "create" unless (etc/"elasticsearch/elasticsearch.keystore").exist?
