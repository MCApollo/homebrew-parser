name :
	 RancherCompose
homepage :
	 https://github.com/rancher/rancher-compose
url :
	 https://github.com/rancher/rancher-compose/archive/v0.12.5.tar.gz
description :
	 Docker Compose compatible client to deploy to Rancher
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
	 (buildpath/"src/github.com/rancher/rancher-compose").install Dir["*"]
	 system "go", "build", "-ldflags",
	 "-w -X github.com/rancher/rancher-compose/version.VERSION=#{version}",
	 "-o", "#{bin}/rancher-compose",
	 "-v", "github.com/rancher/rancher-compose"
	 prefix.install_metafiles "src/github.com/rancher/rancher-compose"
