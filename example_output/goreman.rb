name :
	 Goreman
homepage :
	 https://github.com/mattn/goreman
url :
	 https://github.com/mattn/goreman/archive/v0.2.1.tar.gz
description :
	 Foreman clone written in Go
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV["GO111MODULE"] = "on"
	 srcpath = buildpath/"src/github.com/mattn/goreman"
	 srcpath.install buildpath.children
	 cd srcpath do
	 system "go", "build", "-o", bin/"goreman"
	 prefix.install_metafiles
