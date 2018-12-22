name :
	 Forego
homepage :
	 https://github.com/ddollar/forego
url :
	 https://github.com/ddollar/forego/archive/20180216151118.tar.gz
description :
	 Foreman in Go for Procfile-based application management
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/ddollar/forego").install buildpath.children
	 cd "src/github.com/ddollar/forego" do
	 system "go", "build", "-o", bin/"forego", "-ldflags",
	 "-X main.Version=#{version} -X main.allowUpdate=false"
	 prefix.install_metafiles
	 end
