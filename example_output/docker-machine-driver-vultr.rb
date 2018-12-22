name :
	 DockerMachineDriverVultr
homepage :
	 https://github.com/janeczku/docker-machine-vultr
url :
	 https://github.com/janeczku/docker-machine-vultr/archive/v1.4.0.tar.gz
description :
	 Docker Machine driver plugin for Vultr Cloud
build_deps :
	 go
	 godep
link_deps :
	 docker-machine
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/janeczku/docker-machine-vultr").install buildpath.children
	 cd "src/github.com/janeczku/docker-machine-vultr" do
	 system "make"
	 bin.install "build/docker-machine-driver-vultr-v#{version}" => "docker-machine-driver-vultr"
	 prefix.install_metafiles
	 end
