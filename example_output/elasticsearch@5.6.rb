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
	 :java
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
	 end
	 inreplace "#{libexec}/bin/elasticsearch.in.sh" do |s|
	 s.sub!(%r{#\!/bin/bash\n}, "#!/bin/bash\n\nES_HOME=#{libexec}")
	 end
	 inreplace "#{libexec}/bin/elasticsearch-plugin" do |s|
	 s.sub!(/SCRIPT="\$0"/, %Q(SCRIPT="$0"\nES_CLASSPATH=#{libexec}/lib))
	 s.gsub!(%r{\$ES_HOME/lib/}, "$ES_CLASSPATH/")
	 end
	 (etc/"elasticsearch").install Dir[libexec/"config/*"]
	 (etc/"elasticsearch/scripts").mkdir unless File.exist?(etc/"elasticsearch/scripts")
	 (libexec/"config").rmtree
	 bin.install libexec/"bin/elasticsearch",
	 libexec/"bin/elasticsearch-keystore",
	 libexec/"bin/elasticsearch-plugin",
	 libexec/"bin/elasticsearch-translog"
	 bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))
	 (var/"elasticsearch/#{cluster_name}").mkpath
	 (var/"log/elasticsearch").mkpath
	 ln_s etc/"elasticsearch", libexec/"config"
	 (libexec/"plugins").mkdir
