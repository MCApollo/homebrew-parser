name :
	 Dep
homepage :
	 https://github.com/golang/dep
url :
	 https://github.com/golang/dep.git
description :
	 Go dependency management tool
build_deps :
link_deps :
	 go
conflicts :
	 deployer
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 arch = MacOS.prefer_64_bit? ? "amd64" : "386"
	 (buildpath/"src/github.com/golang/dep").install buildpath.children
	 cd "src/github.com/golang/dep" do
	 ENV["DEP_BUILD_PLATFORMS"] = "darwin"
	 ENV["DEP_BUILD_ARCHS"] = arch
	 system "hack/build-all.bash"
	 bin.install "release/dep-darwin-#{arch}" => "dep"
	 prefix.install_metafiles
	 end
