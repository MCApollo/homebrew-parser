name :
	 CoreosCt
homepage :
	 https://coreos.com/os/docs/latest/configuration.html
url :
	 https://github.com/coreos/container-linux-config-transpiler/archive/v0.9.0.tar.gz
description :
	 Convert a Container Linux Config into Ignition
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "all", "VERSION=v#{version}"
	 bin.install "./bin/ct"
