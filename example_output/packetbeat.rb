name :
	 Packetbeat
homepage :
	 https://www.elastic.co/products/beats/packetbeat
url :
	 https://github.com/elastic/beats/archive/v6.2.4.tar.gz
description :
	 Lightweight Shipper for Network Data
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
	 end
	 ENV.prepend_path "PATH", buildpath/"vendor/bin"
	 cd "src/github.com/elastic/beats/packetbeat" do
	 system "make"
	 system "make", "PIP_INSTALL_COMMANDS=--no-binary :all", "python-env"
	 system "make", "DEV_OS=darwin", "update"
	 inreplace "packetbeat.yml", "packetbeat.interfaces.device: any", "packetbeat.interfaces.device: en0"
	 (etc/"packetbeat").install Dir["packetbeat.*", "fields.yml"]
	 (libexec/"bin").install "packetbeat"
	 prefix.install "_meta/kibana"
	 end
	 prefix.install_metafiles buildpath/"src/github.com/elastic/beats"
	 (bin/"packetbeat").write <<~EOS
	 #!/bin/sh
	 exec #{libexec}/bin/packetbeat \
	 --path.config #{etc}/packetbeat \
	 --path.data #{var}/lib/packetbeat \
	 --path.home #{prefix} \
	 --path.logs #{var}/log/packetbeat \
	 "$@"
	 EOS
