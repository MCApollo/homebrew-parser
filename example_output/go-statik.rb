name :
	 GoStatik
homepage :
	 https://github.com/rakyll/statik
url :
	 https://github.com/rakyll/statik/archive/v0.1.5.tar.gz
description :
	 Embed files into a Go executable
build_deps :
	 go
link_deps :
conflicts :
	 statik
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
	 (buildpath/"src/github.com/rakyll/statik").install buildpath.children
	 cd "src/github.com/rakyll/statik" do
	 system "go", "build", "-o", bin/"statik"
	 prefix.install_metafiles
