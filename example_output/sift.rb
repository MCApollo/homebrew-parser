name :
	 Sift
homepage :
	 https://sift-tool.org
url :
	 https://github.com/svent/sift/archive/v0.9.0.tar.gz
description :
	 Fast and powerful open source alternative to grep
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/svent/sift").install buildpath.children
	 Language::Go.stage_deps resources, buildpath/"src"
	 cd "src/github.com/svent/sift" do
	 system "go", "build", "-o", bin/"sift"
	 prefix.install_metafiles
	 end
