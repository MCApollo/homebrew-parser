name :
	 Skaffold
homepage :
	 https://github.com/GoogleContainerTools/skaffold
url :
	 https://github.com/GoogleContainerTools/skaffold.git
description :
	 Easy and Repeatable Kubernetes Development
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/GoogleContainerTools/skaffold"
	 dir.install buildpath.children - [buildpath/".brew_home"]
	 cd dir do
	 system "make"
	 bin.install "out/skaffold"
	 prefix.install_metafiles
	 end
