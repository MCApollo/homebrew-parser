name :
	 RancherCli
homepage :
	 https://github.com/rancher/cli
url :
	 https://github.com/rancher/cli/archive/v2.0.6.tar.gz
description :
	 The Rancher CLI is a unified tool to manage your Rancher server
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
	 (buildpath/"src/github.com/rancher/cli/").install Dir["*"]
	 system "go", "build", "-ldflags",
	 "-w -X github.com/rancher/cli/version.VERSION=#{version}",
	 "-o", "#{bin}/rancher",
	 "-v", "github.com/rancher/cli/"
