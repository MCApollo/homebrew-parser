name :
	 Serf
homepage :
	 https://serfdom.io/
url :
	 https://github.com/hashicorp/serf.git
description :
	 Service orchestration and management tool
build_deps :
	 go
	 govendor
	 gox
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 contents = Dir["*"]
	 gopath = buildpath/"gopath"
	 (gopath/"src/github.com/hashicorp/serf").install contents
	 ENV["GOPATH"] = gopath
	 arch = MacOS.prefer_64_bit? ? "amd64" : "386"
	 ENV["XC_ARCH"] = arch
	 ENV["XC_OS"] = "darwin"
	 (gopath/"bin").mkpath
	 cd gopath/"src/github.com/hashicorp/serf" do
	 system "make", "bin"
	 bin.install "bin/serf"
	 prefix.install_metafiles
	 end
