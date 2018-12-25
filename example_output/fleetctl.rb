name :
	 Fleetctl
homepage :
	 https://github.com/coreos/fleet
url :
	 https://github.com/coreos/fleet.git
description :
	 Distributed init system
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
	 system "./build"
	 bin.install "bin/fleetctl"
