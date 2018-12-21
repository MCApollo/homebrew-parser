name :
	 GoBindata
homepage :
	 https://github.com/kevinburke/go-bindata
url :
	 https://github.com/kevinburke/go-bindata/archive/v3.12.0.tar.gz
description :
	 Small utility that generates Go code from any file
build_deps :
link_deps :
	 go
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/kevinburke").mkpath
	 ln_s buildpath, buildpath/"src/github.com/kevinburke/go-bindata"
	 system "go", "build", "-o", bin/"go-bindata", "./go-bindata"
