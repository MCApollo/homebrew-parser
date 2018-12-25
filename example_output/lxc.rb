name :
	 Lxc
homepage :
	 https://linuxcontainers.org
url :
	 https://linuxcontainers.org/downloads/lxd/lxd-3.8.tar.gz
description :
	 CLI client for interacting with LXD
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
	 ENV["GOBIN"] = bin
	 ln_s buildpath/"dist/src", buildpath/"src"
	 system "go", "install", "-v", "github.com/lxc/lxd/lxc"
