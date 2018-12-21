name :
	 Ctop
homepage :
	 https://bcicen.github.io/ctop/
url :
	 https://github.com/bcicen/ctop/archive/v0.7.1.tar.gz
description :
	 Top-like interface for container metrics
build_deps :
	 dep
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/bcicen/ctop").install buildpath.children
	 cd "src/github.com/bcicen/ctop" do
	 system "make", "build"
	 bin.install "ctop"
	 prefix.install_metafiles
