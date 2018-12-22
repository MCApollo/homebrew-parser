name :
	 Filebeat
homepage :
	 https://www.elastic.co/products/beats/filebeat
url :
	 https://github.com/elastic/beats/archive/v6.2.4.tar.gz
description :
	 File harvester to ship log files to Elasticsearch or Logstash
build_deps :
	 go
	 python@2
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/elastic/beats").install Dir["{*,.git,.gitignore}"]
	 ENV.prepend_create_path "PYTHONPATH", buildpath/"vendor/lib/python2.7/site-packages"
	 resource("virtualenv").stage do
	 system "python", *Language::Python.setup_install_args(buildpath/"vendor")
	 end
	 ENV.prepend_path "PATH", buildpath/"vendor/bin"
	 cd "src/github.com/elastic/beats/filebeat" do
	 system "make"
	 system "make", "PIP_INSTALL_COMMANDS=--no-binary :all", "python-env"
	 system "make", "DEV_OS=darwin", "update"
	 system "make", "modules"
	 (etc/"filebeat").install Dir["filebeat.*", "fields.yml", "modules.d"]
	 (etc/"filebeat"/"module").install Dir["_meta/module.generated/*"]
	 (libexec/"bin").install "filebeat"
	 prefix.install "_meta/kibana"
	 end
	 prefix.install_metafiles buildpath/"src/github.com/elastic/beats"
	 (bin/"filebeat").write <<~EOS
	 #!/bin/sh
	 exec #{libexec}/bin/filebeat \
	 --path.config #{etc}/filebeat \
	 --path.data #{var}/lib/filebeat \
	 --path.home #{prefix} \
	 --path.logs #{var}/log/filebeat \
	 "$@"
	 EOS
