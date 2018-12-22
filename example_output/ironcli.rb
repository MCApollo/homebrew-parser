name :
	 Ironcli
homepage :
	 https://github.com/iron-io/ironcli
url :
	 https://github.com/iron-io/ironcli/archive/0.1.6.tar.gz
description :
	 Go version of the Iron.io command-line tools
build_deps :
	 dep
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/iron-io/ironcli").install buildpath.children
	 cd "src/github.com/iron-io/ironcli" do
	 system "dep", "ensure", "-vendor-only"
	 system "go", "build", "-o", bin/"iron"
	 prefix.install_metafiles
	 end
