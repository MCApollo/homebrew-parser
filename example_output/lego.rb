name :
	 Lego
homepage :
	 https://github.com/xenolf/lego
url :
	 https://github.com/xenolf/lego/archive/v1.2.1.tar.gz
description :
	 Let's Encrypt client
build_deps :
	 go
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/xenolf/lego").install buildpath.children
	 cd "src/github.com/xenolf/lego" do
	 system "go", "build", "-o", bin/"lego", "-ldflags",
	 "-X main.version=#{version}"
	 prefix.install_metafiles
	 end
