name :
	 Heartbeat
homepage :
	 https://www.elastic.co/products/beats/heartbeat
url :
	 https://github.com/elastic/beats/archive/v6.2.4.tar.gz
description :
	 Lightweight Shipper for Uptime Monitoring
build_deps :
	 go
	 python@2
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/elastic/beats").install buildpath.children
	 ENV.prepend_create_path "PYTHONPATH", buildpath/"vendor/lib/python2.7/site-packages"
	 resource("virtualenv").stage do
	 system "python", *Language::Python.setup_install_args(buildpath/"vendor")
	 (var/"lib/heartbeat").mkpath
	 (var/"log/heartbeat").mkpath
