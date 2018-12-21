name :
	 ApmServer
homepage :
	 https://www.elastic.co/
url :
	 https://github.com/elastic/apm-server/archive/v6.2.4.tar.gz
description :
	 Server for shipping APM metrics to Elasticsearch
build_deps :
	 go
	 python@2
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/elastic/apm-server").install buildpath.children
	 ENV.prepend_create_path "PYTHONPATH", buildpath/"vendor/lib/python2.7/site-packages"
	 resource("virtualenv").stage do
	 system "python", *Language::Python.setup_install_args(buildpath/"vendor")
	 (var/"lib/apm-server").mkpath
	 (var/"log/apm-server").mkpath
