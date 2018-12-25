name :
	 Compose2kube
homepage :
	 https://github.com/kelseyhightower/compose2kube
url :
	 https://github.com/kelseyhightower/compose2kube/archive/0.0.2.tar.gz
description :
	 Convert docker-compose service files to Kubernetes objects
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
	 (buildpath/"src/github.com/kelseyhightower/compose2kube").install buildpath.children
	 cd "src/github.com/kelseyhightower/compose2kube" do
	 system "go", "build", "-o", bin/"compose2kube"
	 prefix.install_metafiles
	 end
