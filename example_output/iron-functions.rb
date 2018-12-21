name :
	 IronFunctions
homepage :
	 https://github.com/iron-io/functions
url :
	 https://github.com/iron-io/functions/archive/0.2.72.tar.gz
description :
	 Go version of the IronFunctions command-line tools
build_deps :
	 dep
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/iron-io/functions"
	 dir.install Dir["*"]
	 cd dir/"fn" do
	 system "make", "dep"
	 system "go", "build", "-o", bin/"fn"
	 prefix.install_metafiles
