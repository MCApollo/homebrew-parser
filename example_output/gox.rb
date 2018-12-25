name :
	 Gox
homepage :
	 https://github.com/mitchellh/gox
url :
	 https://github.com/mitchellh/gox/archive/v0.4.0.tar.gz
description :
	 Go cross compile tool
build_deps :
link_deps :
	 go
optional_deps :
conflicts :
resource :
	 ['iochan', 'pup']
	 ['https://github.com/mitchellh/iochan.git', 'https://github.com/ericchiang/pup/archive/v0.4.0.tar.gz']
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/mitchellh/gox").install buildpath.children
	 (buildpath/"src/github.com/mitchellh/iochan").install resource("iochan")
	 cd "src/github.com/mitchellh/gox" do
	 system "go", "build", "-o", bin/"gox"
	 prefix.install_metafiles
	 end
