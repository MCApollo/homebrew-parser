name :
	 Gollum
homepage :
	 https://github.com/trivago/gollum
url :
	 https://github.com/trivago/gollum/archive/v0.5.3.tar.gz
description :
	 n:m message multiplexer written in Go
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/trivago/gollum").install buildpath.children
	 cd "src/github.com/trivago/gollum" do
	 system "go", "build", "-o", bin/"gollum"
	 prefix.install_metafiles
