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
