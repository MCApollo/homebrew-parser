name :
	 Clipper
homepage :
	 https://wincent.com/products/clipper
url :
	 https://github.com/wincent/clipper/archive/2.0.0.tar.gz
description :
	 Share macOS clipboard with tmux and other local and remote apps
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 system "go", "build", "clipper.go"
	 bin.install "clipper"
