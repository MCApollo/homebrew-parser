name :
	 Metricbeat
homepage :
	 https://www.elastic.co/products/beats/metricbeat
url :
	 https://github.com/elastic/beats/archive/v6.2.4.tar.gz
description :
	 Collect metrics from your systems and services
build_deps :
	 go
	 python@2
link_deps :
optional_deps :
conflicts :
resource :
	 ['virtualenv']
	 ['https://files.pythonhosted.org/packages/b1/72/2d70c5a1de409ceb3a27ff2ec007ecdd5cc52239e7c74990e32af57affe9/virtualenv-15.2.0.tar.gz']
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
	 cd "src/github.com/elastic/beats/metricbeat" do
	 system "make"
	 system "make", "PIP_INSTALL_COMMANDS=--no-binary :all", "python-env"
	 system "make", "DEV_OS=darwin", "update"
	 (etc/"metricbeat").install Dir["metricbeat.*", "fields.yml", "modules.d"]
	 (libexec/"bin").install "metricbeat"
	 prefix.install "_meta/kibana"
	 end
	 prefix.install_metafiles buildpath/"src/github.com/elastic/beats"
	 (bin/"metricbeat").write <<~EOS
	 #!/bin/sh
	 exec #{libexec}/bin/metricbeat \
	 --path.config #{etc}/metricbeat \
	 --path.data #{var}/lib/metricbeat \
	 --path.home #{prefix} \
	 --path.logs #{var}/log/metricbeat \
	 "$@"
	 EOS
