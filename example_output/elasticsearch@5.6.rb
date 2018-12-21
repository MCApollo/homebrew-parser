name :
	 ElasticsearchAT56
homepage :
	 https://www.elastic.co/products/elasticsearch
url :
	 https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.14.tar.gz
description :
	 Distributed search & analytics engine
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.bat"]
	 rm_f Dir["bin/*.exe"]
	 libexec.install "bin", "config", "lib", "modules"
	 inreplace "#{libexec}/config/elasticsearch.yml" do |s|
	 s.gsub!(/#\s*cluster\.name\: .*/, "cluster.name: #{cluster_name}")
	 s.sub!(%r{#\s*path\.data: /path/to.+$}, "path.data: #{var}/elasticsearch/")
	 s.sub!(%r{#\s*path\.logs: /path/to.+$}, "path.logs: #{var}/log/elasticsearch/")
	 (var/"elasticsearch/#{cluster_name}").mkpath
	 (var/"log/elasticsearch").mkpath
	 ln_s etc/"elasticsearch", libexec/"config"
	 (libexec/"plugins").mkdir
