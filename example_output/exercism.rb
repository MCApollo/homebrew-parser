name :
	 Exercism
homepage :
	 https://cli.exercism.io/
url :
	 https://github.com/exercism/cli/archive/v3.0.11.tar.gz
description :
	 Command-line tool to interact with exercism.io
build_deps :
	 dep
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/exercism/cli").install buildpath.children
	 cd "src/github.com/exercism/cli" do
	 system "dep", "ensure", "-vendor-only"
	 system "go", "build", "-o", bin/"exercism", "exercism/main.go"
	 prefix.install_metafiles
	 end
