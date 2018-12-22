name :
	 Consul
homepage :
	 https://www.consul.io
url :
	 https://github.com/hashicorp/consul.git
description :
	 Tool for service discovery, monitoring and configuration
build_deps :
	 go
	 gox
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "GNUmakefile", "go get -u -v $(GOTOOLS)", ""
	 ENV["XC_OS"] = "darwin"
	 ENV["XC_ARCH"] = MacOS.prefer_64_bit? ? "amd64" : "386"
	 ENV["GOPATH"] = buildpath
	 contents = Dir["{*,.git,.gitignore}"]
	 (buildpath/"src/github.com/hashicorp/consul").install contents
	 (buildpath/"bin").mkpath
	 cd "src/github.com/hashicorp/consul" do
	 system "make"
	 bin.install "bin/consul"
	 prefix.install_metafiles
	 end
