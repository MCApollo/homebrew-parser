name :
	 DockerMachineDriverHyperkit
homepage :
	 https://github.com/machine-drivers/docker-machine-driver-hyperkit
url :
	 https://github.com/machine-drivers/docker-machine-driver-hyperkit.git
description :
	 Docker Machine driver for hyperkit
build_deps :
	 dep
	 go
link_deps :
	 docker-machine
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/machine-drivers/docker-machine-driver-hyperkit"
	 dir.install buildpath.children
	 cd dir do
	 system "dep", "ensure", "-vendor-only"
	 system "go", "build", "-o", "#{bin}/docker-machine-driver-hyperkit",
	 "-ldflags", "-X main.version=#{version}"
	 prefix.install_metafiles
	 end
