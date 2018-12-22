name :
	 Rke
homepage :
	 https://rancher.com/docs/rke/v0.1.x/en/
url :
	 https://github.com/rancher/rke.git
description :
	 Rancher Kubernetes Engine, a Kubernetes installer that works everywhere
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/rancher/rke").install buildpath.children
	 cd "src/github.com/rancher/rke" do
	 system "go", "build", "-ldflags",
	 "-w -X main.VERSION=v#{version}",
	 "-o", bin/"rke"
	 prefix.install_metafiles
	 end
