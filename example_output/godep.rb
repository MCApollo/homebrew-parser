name :
	 Godep
homepage :
	 https://godoc.org/github.com/tools/godep
url :
	 https://github.com/tools/godep/archive/v80.tar.gz
description :
	 Dependency tool for go
build_deps :
link_deps :
	 go
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/tools/godep").install buildpath.children
	 cd "src/github.com/tools/godep" do
	 system "go", "build", "-o", bin/"godep"
	 prefix.install_metafiles
