name :
	 Ark
homepage :
	 https://github.com/heptio/ark
url :
	 https://github.com/heptio/ark/archive/v0.10.0.tar.gz
description :
	 Disaster recovery for Kubernetes cluster resources and persistent volumes
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/heptio/ark").install buildpath.children
	 cd "src/github.com/heptio/ark" do
	 system "go", "build", "-o", bin/"ark", "-installsuffix", "static",
	 "-ldflags",
	 "-X github.com/heptio/ark/pkg/buildinfo.Version=#{version}",
	 "./cmd/ark"
	 prefix.install_metafiles
