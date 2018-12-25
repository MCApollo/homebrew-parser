name :
	 Kedge
homepage :
	 http://kedgeproject.org/
url :
	 https://github.com/kedgeproject/kedge/archive/v0.12.0.tar.gz
description :
	 Deployment tool for Kubernetes artifacts
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
	 (buildpath/"src/github.com/kedgeproject").mkpath
	 ln_s buildpath, buildpath/"src/github.com/kedgeproject/kedge"
	 system "make", "bin"
	 bin.install "kedge"
