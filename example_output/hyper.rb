name :
	 Hyper
homepage :
	 https://hyper.sh
url :
	 https://github.com/hyperhq/hypercli.git
description :
	 Client for HyperHQ's cloud service
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
	 mkdir_p "src/github.com/hyperhq"
	 ln_s buildpath, "src/github.com/hyperhq/hypercli"
	 system "./build.sh"
	 bin.install "hyper/hyper"
