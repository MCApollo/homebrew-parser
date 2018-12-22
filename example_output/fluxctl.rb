name :
	 Fluxctl
homepage :
	 https://github.com/weaveworks/flux
url :
	 https://github.com/weaveworks/flux.git
description :
	 Command-line tool to access Weave Flux, the Kubernetes GitOps operator
build_deps :
	 dep
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/weaveworks/flux"
	 dir.install buildpath.children - [buildpath/".brew_home"]
	 cd dir do
	 system "dep", "ensure", "-vendor-only"
	 system "make", "release-bins"
	 bin.install "build/fluxctl_darwin_amd64" => "fluxctl"
	 prefix.install_metafiles
	 end
