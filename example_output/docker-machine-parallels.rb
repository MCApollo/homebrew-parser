name :
	 DockerMachineParallels
homepage :
	 https://github.com/Parallels/docker-machine-parallels
url :
	 https://github.com/Parallels/docker-machine-parallels/archive/v1.3.0.tar.gz
description :
	 Docker Machine Parallels Driver
build_deps :
	 go
link_deps :
	 docker-machine
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 path = buildpath/"src/github.com/Parallels/docker-machine-parallels"
	 path.install Dir["*"]
	 cd path do
	 system "make", "build"
	 bin.install "bin/docker-machine-driver-parallels"
	 end
	 prefix.install_metafiles path
