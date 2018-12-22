name :
	 Dlite
homepage :
	 https://github.com/nlf/dlite
url :
	 https://github.com/nlf/dlite/archive/1.1.5.tar.gz
description :
	 Provides a way to use docker on macOS without docker-machine
build_deps :
	 go
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 path = buildpath/"src/github.com/nlf/dlite"
	 path.install Dir["*"]
	 cd path do
	 system "make", "dlite"
	 bin.install "dlite"
	 prefix.install_metafiles
	 end
