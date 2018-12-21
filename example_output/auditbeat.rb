name :
	 Auditbeat
homepage :
	 https://www.elastic.co/products/beats/auditbeat
url :
	 https://github.com/elastic/beats/archive/v6.2.4.tar.gz
description :
	 Lightweight Shipper for Audit Data
build_deps :
	 go
	 python@2
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/1ddc0e6/auditbeat/go1.10.diff
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/elastic/beats").install buildpath.children
	 ENV.prepend_create_path "PYTHONPATH", buildpath/"vendor/lib/python2.7/site-packages"
	 resource("virtualenv").stage do
	 system "python", *Language::Python.setup_install_args(buildpath/"vendor")
	 (var/"lib/auditbeat").mkpath
	 (var/"log/auditbeat").mkpath
