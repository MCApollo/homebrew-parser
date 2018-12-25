name :
	 Kubeless
homepage :
	 https://github.com/kubeless/kubeless
url :
	 https://github.com/kubeless/kubeless/archive/v1.0.0.tar.gz
description :
	 Kubernetes Native Serverless Framework
build_deps :
	 go
link_deps :
	 kubernetes-cli
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/kubeless/kubeless").install buildpath.children
	 cd "src/github.com/kubeless/kubeless" do
	 ldflags = %W[
	 -w -X github.com/kubeless/kubeless/pkg/version.Version=v#{version}
	 ]
	 system "go", "build", "-o", bin/"kubeless", "-ldflags",
	 ldflags.join(" "), "./cmd/kubeless"
	 prefix.install_metafiles
	 end
