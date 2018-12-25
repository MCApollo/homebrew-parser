name :
	 Lf
homepage :
	 https://godoc.org/github.com/gokcehan/lf
url :
	 https://github.com/gokcehan/lf/archive/r8.tar.gz
description :
	 Terminal file manager
build_deps :
	 dep
	 go
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV["version"] = version
	 (buildpath/"src/github.com/gokcehan/lf").install buildpath.children
	 cd "src/github.com/gokcehan/lf" do
	 system "dep", "ensure", "-vendor-only"
	 system "./gen/build.sh", "-o", bin/"lf"
	 prefix.install_metafiles
	 end
