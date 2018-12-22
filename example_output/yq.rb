name :
	 Yq
homepage :
	 https://github.com/mikefarah/yq
url :
	 https://github.com/mikefarah/yq/archive/v2.2.0.tar.gz
description :
	 Process YAML documents from the CLI
build_deps :
	 go
	 govendor
link_deps :
conflicts :
	 python-yq
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/mikefarah/yq").install buildpath.children
	 cd "src/github.com/mikefarah/yq" do
	 system "govendor", "sync"
	 system "go", "build", "-o", bin/"yq"
	 prefix.install_metafiles
	 end
