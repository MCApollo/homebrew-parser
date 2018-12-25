name :
	 ElasticsearchAT24
homepage :
	 https://www.elastic.co/products/elasticsearch
url :
	 https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.4.6/elasticsearch-2.4.6.tar.gz
description :
	 Distributed search & analytics engine
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
resource :
	 []
	 []
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
	 end
	 inreplace "#{libexec}/bin/elasticsearch.in.sh" do |s|
	 s.sub!(%r{#\!/bin/sh\n}, "#!/bin/sh\n\nES_HOME=#{libexec}")
	 end
	 inreplace "#{libexec}/bin/plugin" do |s|
	 s.sub!(/SCRIPT="\$0"/, %Q(SCRIPT="$0"\nES_CLASSPATH=#{libexec}/lib))
	 s.gsub!(%r{\$ES_HOME/lib/}, "$ES_CLASSPATH/")
	 end
	 (etc/"elasticsearch").install Dir[libexec/"config/*"]
	 (etc/"elasticsearch/scripts").mkpath
	 (libexec/"config").rmtree
	 bin.install libexec/"bin/elasticsearch",
	 libexec/"bin/plugin"
	 bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))
	 (var/"elasticsearch/#{cluster_name}").mkpath
	 (var/"log/elasticsearch").mkpath
	 ln_s etc/"elasticsearch", libexec/"config"
	 (libexec/"plugins").mkdir
