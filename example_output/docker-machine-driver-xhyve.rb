name :
	 DockerMachineDriverXhyve
homepage :
	 https://github.com/machine-drivers/docker-machine-driver-xhyve
url :
	 https://github.com/machine-drivers/docker-machine-driver-xhyve.git
description :
	 Docker Machine driver for xhyve
build_deps :
	 go
link_deps :
	 :macos
	 docker-machine
conflicts :
patches :
EOF_patch :
install :
	 (buildpath/"gopath/src/github.com/zchee/docker-machine-driver-xhyve").install Dir["{*,.git,.gitignore,.gitmodules}"]
	 ENV["GOPATH"] = "#{buildpath}/gopath"
	 build_root = buildpath/"gopath/src/github.com/zchee/docker-machine-driver-xhyve"
	 build_tags = "lib9p"
	 cd build_root do
	 git_hash = `git rev-parse --short HEAD --quiet`.chomp
	 git_hash = "HEAD-#{git_hash}" if build.head?
	 go_ldflags = "-w -s -X 'github.com/zchee/docker-machine-driver-xhyve/xhyve.GitCommit=Homebrew#{git_hash}'"
	 ENV["GO_LDFLAGS"] = go_ldflags
	 ENV["GO_BUILD_TAGS"] = build_tags
	 system "make", "build", "CC=#{ENV.cc}"
	 bin.install "bin/docker-machine-driver-xhyve"
	 prefix.install_metafiles
