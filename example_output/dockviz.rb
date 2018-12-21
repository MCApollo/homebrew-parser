name :
	 Dockviz
homepage :
	 https://github.com/justone/dockviz
url :
	 https://github.com/justone/dockviz.git
description :
	 Visualizing docker data
build_deps :
	 go
	 govendor
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/justone/dockviz").install buildpath.children
	 cd "src/github.com/justone/dockviz" do
	 system "govendor", "sync"
	 system "go", "build", "-o", bin/"dockviz"
	 prefix.install_metafiles
