name :
	 PathExtractor
homepage :
	 https://github.com/edi9999/path-extractor
url :
	 https://github.com/edi9999/path-extractor/archive/v0.2.0.tar.gz
description :
	 UNIX filter which outputs the filepaths found in stdin
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
	 ENV["GOBIN"] = bin
	 ENV["GOPATH"] = buildpath
	 ENV["GOHOME"] = buildpath
	 (buildpath/"src/github.com/edi9999").mkpath
	 ln_sf buildpath, buildpath/"src/github.com/edi9999/path-extractor"
	 system "go", "build", "-o", bin/"path-extractor", "path-extractor/pe.go"
