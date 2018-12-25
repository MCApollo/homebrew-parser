name :
	 DockerMachine
homepage :
	 https://docs.docker.com/machine
url :
	 https://github.com/docker/machine.git
description :
	 Create Docker hosts locally and on cloud providers
build_deps :
	 automake
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
	 (buildpath/"src/github.com/docker/machine").install buildpath.children
	 cd "src/github.com/docker/machine" do
	 system "make", "build"
	 bin.install Dir["bin/*"]
	 bash_completion.install Dir["contrib/completion/bash/*.bash"]
	 zsh_completion.install "contrib/completion/zsh/_docker-machine"
	 prefix.install_metafiles
	 end
