name :
	 Krakend
homepage :
	 https://www.krakend.io/
url :
	 https://github.com/devopsfaith/krakend-ce/archive/0.7.0.tar.gz
description :
	 Ultra-High performance API Gateway built in Go
build_deps :
	 dep
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/devopsfaith/krakend-ce").install buildpath.children
	 cd "src/github.com/devopsfaith/krakend-ce" do
	 system "make", "deps"
	 system "make", "build"
	 bin.install "krakend"
	 prefix.install_metafiles
