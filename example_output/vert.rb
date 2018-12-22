name :
	 Vert
homepage :
	 https://github.com/Masterminds/vert
url :
	 https://github.com/Masterminds/vert/archive/v0.1.0.tar.gz
description :
	 Command-line version testing
build_deps :
	 dep
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/Masterminds/vert").install buildpath.children
	 cd "src/github.com/Masterminds/vert" do
	 system "dep", "ensure", "-vendor-only"
	 system "make", "build"
	 bin.install "vert"
	 prefix.install_metafiles
	 end
