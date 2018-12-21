name :
	 Perkeep
homepage :
	 https://perkeep.org/
url :
	 https://github.com/perkeep/perkeep.git
description :
	 Lets you permanently keep your stuff, for life
build_deps :
	 go
	 pkg-config
link_deps :
conflicts :
	 hello
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/perkeep.org").install buildpath.children
	 cd "src/perkeep.org" do
	 system "go", "run", "make.go"
	 prefix.install_metafiles
