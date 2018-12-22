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
	 end
	 rm_f Dir["bin/*.bat"]
	 rm_f Dir["bin/*.exe"]
	 libexec.install "bin", "config", "lib", "modules"
	 inreplace libexec/"bin/elasticsearch-env",
	 "if [ -z \"$ES_PATH_CONF\" ]; then ES_PATH_CONF=\"$ES_HOME\"/config; fi",
	 "if [ -z \"$ES_PATH_CONF\" ]; then ES_PATH_CONF=\"#{etc}/elasticsearch\"; fi"
	 inreplace "#{libexec}/config/elasticsearch.yml" do |s|
	 s.gsub!(/#\s*cluster\.name\: .*/, "cluster.name: #{cluster_name}")
	 s.sub!(%r{#\s*path\.data: /path/to.+$}, "path.data: #{var}/lib/elasticsearch/")
	 s.sub!(%r{#\s*path\.logs: /path/to.+$}, "path.logs: #{var}/log/elasticsearch/")
	 end
	 (etc/"elasticsearch").install Dir[libexec/"config/*"]
	 (libexec/"config").rmtree
	 bin.install libexec/"bin/elasticsearch",
	 libexec/"bin/elasticsearch-keystore",
	 libexec/"bin/elasticsearch-plugin",
	 libexec/"bin/elasticsearch-translog"
	 bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))
	 (var/"lib/elasticsearch/#{cluster_name}").mkpath
	 (var/"log/elasticsearch").mkpath
	 ln_s etc/"elasticsearch", libexec/"config"
	 (var/"elasticsearch/plugins").mkpath
	 ln_s var/"elasticsearch/plugins", libexec/"plugins"
	 system bin/"elasticsearch-keystore", "create" unless (etc/"elasticsearch/elasticsearch.keystore").exist?
