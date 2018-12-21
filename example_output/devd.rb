name :
	 Devd
homepage :
	 https://github.com/cortesi/devd
url :
	 https://github.com/cortesi/devd/archive/v0.8.tar.gz
description :
	 Local webserver for developers
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
	 (buildpath/"src/github.com/cortesi/devd").install buildpath.children
	 cd "src/github.com/cortesi/devd" do
	 system "go", "build", "-o", bin/"devd", ".../cmd/devd"
	 prefix.install_metafiles
