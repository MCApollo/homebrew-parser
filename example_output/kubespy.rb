name :
	 Kubespy
homepage :
	 https://github.com/pulumi/kubespy
url :
	 https://github.com/pulumi/kubespy.git
description :
	 Tools for observing Kubernetes resources in realtime
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
	 dir = buildpath/"src/github.com/pulumi/kubespy"
	 dir.install buildpath.children
	 cd dir do
	 system "make", "build"
	 bin.install "kubespy"
	 prefix.install_metafiles
