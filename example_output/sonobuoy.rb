name :
	 Sonobuoy
homepage :
	 https://github.com/heptio/sonobuoy
url :
	 https://github.com/heptio/sonobuoy/archive/v0.13.0.tar.gz
description :
	 Kubernetes component that generates reports on cluster conformance
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/heptio/sonobuoy").install buildpath.children
	 cd "src/github.com/heptio/sonobuoy" do
	 system "go", "build", "-o", bin/"sonobuoy", "-installsuffix", "static",
	 "-ldflags",
	 "-s -w -X github.com/heptio/sonobuoy/pkg/buildinfo.Version=#{version}",
	 "./"
	 prefix.install_metafiles
	 end
