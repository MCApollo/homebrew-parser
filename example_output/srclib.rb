name :
	 Srclib
homepage :
	 https://srclib.org
url :
	 https://github.com/sourcegraph/srclib/archive/v0.2.5.tar.gz
description :
	 Polyglot code analysis library, built for hackability
build_deps :
	 go
	 godep
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOBIN"] = bin
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/sourcegraph.com/sourcegraph/srclib").install buildpath.children
	 cd "src/sourcegraph.com/sourcegraph/srclib" do
	 system "godep", "restore"
	 system "go", "build", "-o", bin/"srclib", "./cmd/srclib"
	 prefix.install_metafiles
