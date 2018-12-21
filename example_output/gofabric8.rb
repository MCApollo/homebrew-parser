name :
	 Gofabric8
homepage :
	 https://github.com/fabric8io/gofabric8/
url :
	 https://github.com/fabric8io/gofabric8/archive/v0.4.176.tar.gz
description :
	 CLI for fabric8 running on Kubernetes or OpenShift
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/fabric8io/gofabric8"
	 dir.install buildpath.children
	 cd dir do
	 system "make", "install", "REV=homebrew"
	 prefix.install_metafiles
