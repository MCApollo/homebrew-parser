name :
	 Deisctl
homepage :
	 https://deis.io/
url :
	 https://github.com/deis/deis/archive/v1.13.4.tar.gz
description :
	 Deis Control Utility
build_deps :
	 go
	 godep
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
	 (buildpath/"src/github.com/deis").mkpath
	 ln_s buildpath, "src/github.com/deis/deis"
	 system "godep", "restore"
	 system "go", "build", "-o", bin/"deisctl", "deisctl/deisctl.go"
