name :
	 Emp
homepage :
	 https://github.com/remind101/empire
url :
	 https://github.com/remind101/empire/archive/v0.13.0.tar.gz
description :
	 CLI for Empire
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/remind101/").mkpath
	 ln_s buildpath, buildpath/"src/github.com/remind101/empire"
	 system "go", "build", "-o", bin/"emp", "./src/github.com/remind101/empire/cmd/emp"
