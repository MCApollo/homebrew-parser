name :
	 Shellz
homepage :
	 https://github.com/evilsocket/shellz
url :
	 https://github.com/evilsocket/shellz/archive/v1.4.0.tar.gz
description :
	 Small utility to track and control custom shellz
build_deps :
	 dep
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/evilsocket/shellz").install buildpath.children
	 cd "src/github.com/evilsocket/shellz" do
	 system "dep", "ensure", "-vendor-only"
	 system "make", "build"
	 bin.install "shellz"
	 prefix.install_metafiles
