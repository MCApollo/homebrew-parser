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
	 end
	 ENV.prepend_path "PATH", buildpath/"vendor/bin"
	 cd "src/github.com/elastic/apm-server" do
	 system "make"
	 system "make", "PIP_INSTALL_COMMANDS=--no-binary :all", "python-env"
	 system "make", "update"
	 (libexec/"bin").install "apm-server"
	 libexec.install "_meta/kibana"
	 (etc/"apm-server").install Dir["apm-server*.yml"]
	 (etc/"apm-server").install "fields.yml"
	 prefix.install_metafiles
	 end
	 (bin/"apm-server").write <<~EOS
	 #!/bin/sh
	 exec #{libexec}/bin/apm-server \
	 -path.config #{etc}/apm-server \
	 -path.home #{libexec} \
	 -path.logs #{var}/log/apm-server \
	 -path.data #{var}/lib/apm-server \
	 "$@"
	 EOS
	 (var/"lib/apm-server").mkpath
	 (var/"log/apm-server").mkpath
