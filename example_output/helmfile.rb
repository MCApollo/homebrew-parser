name :
	 Helmfile
homepage :
	 https://github.com/roboll/helmfile
url :
	 https://github.com/roboll/helmfile/archive/v0.41.0.tar.gz
description :
	 Deploy Kubernetes Helm Charts
build_deps :
	 go
link_deps :
	 kubernetes-helm
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/roboll/helmfile").install buildpath.children
	 cd "src/github.com/roboll/helmfile" do
	 system "go", "build", "-ldflags", "-X main.Version=v#{version}",
	 "-o", bin/"helmfile", "-v", "github.com/roboll/helmfile"
	 prefix.install_metafiles
	 end
