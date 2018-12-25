name :
	 ContainerDiff
homepage :
	 https://github.com/GoogleContainerTools/container-diff
url :
	 https://github.com/GoogleContainerTools/container-diff/archive/v0.13.1.tar.gz
description :
	 Diff your Docker containers
build_deps :
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
	 (buildpath/"src/github.com/GoogleContainerTools").mkpath
	 ln_sf buildpath, buildpath/"src/github.com/GoogleContainerTools/container-diff"
	 cd "src/github.com/GoogleContainerTools/container-diff" do
	 system "make"
	 bin.install "out/container-diff"
	 end
