name :
	 Goad
homepage :
	 https://goad.io/
url :
	 https://github.com/goadapp/goad.git
description :
	 AWS Lambda powered, highly distributed, load testing tool built in Go
build_deps :
	 go
	 go-bindata
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/goadapp/goad"
	 dir.install buildpath.children
	 cd dir do
	 system "make", "build"
	 bin.install "build/goad"
	 prefix.install_metafiles
