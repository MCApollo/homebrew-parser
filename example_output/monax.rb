name :
	 Monax
homepage :
	 https://github.com/monax/monax
url :
	 https://github.com/monax/monax/archive/v0.18.0.tar.gz
description :
	 Blockchain application platform CLI
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV["GOBIN"] = bin
	 (buildpath/"src/github.com/monax").mkpath
	 ln_sf buildpath, buildpath/"src/github.com/monax/monax"
	 system "go", "install", "github.com/monax/monax/cmd/monax"
