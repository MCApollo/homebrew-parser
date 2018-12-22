name :
	 DockerSwarm
homepage :
	 https://github.com/docker/swarm
url :
	 https://github.com/docker/swarm/archive/v1.2.9.tar.gz
description :
	 Turn a pool of Docker hosts into a single, virtual host
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/docker/swarm").install buildpath.children
	 cd "src/github.com/docker/swarm" do
	 system "go", "build", "-o", bin/"docker-swarm"
	 prefix.install_metafiles
	 end
