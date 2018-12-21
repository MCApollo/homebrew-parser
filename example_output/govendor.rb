name :
	 Govendor
homepage :
	 https://github.com/kardianos/govendor
url :
	 https://github.com/kardianos/govendor/archive/v1.0.9.tar.gz
description :
	 Go vendor tool that works with the standard vendor file
build_deps :
link_deps :
	 go
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV["GOOS"] = "darwin"
	 ENV["GOARCH"] = MacOS.prefer_64_bit? ? "amd64" : "386"
	 (buildpath/"src/github.com/kardianos/").mkpath
	 ln_sf buildpath, buildpath/"src/github.com/kardianos/govendor"
	 system "go", "build", "-o", bin/"govendor"
