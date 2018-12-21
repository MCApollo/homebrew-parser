name :
	 Bettercap
homepage :
	 https://www.bettercap.org/
url :
	 https://github.com/bettercap/bettercap/archive/v2.11.tar.gz
description :
	 Swiss army knife for network attacks and monitoring
build_deps :
	 dep
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/bettercap/bettercap").install buildpath.children
	 cd "src/github.com/bettercap/bettercap" do
	 system "dep", "ensure", "-vendor-only"
	 system "make", "build"
	 bin.install "bettercap"
	 prefix.install_metafiles
