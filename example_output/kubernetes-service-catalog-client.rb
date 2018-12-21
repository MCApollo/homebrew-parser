name :
	 KubernetesServiceCatalogClient
homepage :
	 https://svc-cat.io/
url :
	 https://github.com/kubernetes-incubator/service-catalog.git
description :
	 Consume Services in k8s using the OSB API
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV["NO_DOCKER"] = "1"
	 dir = buildpath/"src/github.com/kubernetes-incubator/service-catalog"
	 dir.install buildpath.children
	 cd dir do
	 ldflags = %W[
	 -s -w -X
	 github.com/kubernetes-incubator/service-catalog/pkg.VERSION=v#{version}
	 ]
	 system "go", "build", "-ldflags", ldflags.join(" "), "-o",
	 bin/"svcat", "./cmd/svcat"
	 prefix.install_metafiles
