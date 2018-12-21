name :
	 Modd
homepage :
	 https://github.com/cortesi/modd
url :
	 https://github.com/cortesi/modd/archive/v0.7.tar.gz
description :
	 Flexible tool for responding to filesystem changes
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOOS"] = "darwin"
	 ENV["GOARCH"] = MacOS.prefer_64_bit? ? "amd64" : "386"
	 ENV["GOPATH"] = buildpath
	 ENV["GOBIN"] = bin
	 (buildpath/"src/github.com/cortesi/modd").install buildpath.children
	 cd "src/github.com/cortesi/modd" do
	 system "go", "install", ".../cmd/modd"
	 prefix.install_metafiles
