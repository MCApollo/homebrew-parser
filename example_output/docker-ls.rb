name :
	 DockerLs
homepage :
	 https://github.com/mayflower/docker-ls
url :
	 https://github.com/mayflower/docker-ls.git
description :
	 Tools for browsing and manipulating docker registries
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/mayflower/docker-ls").install buildpath.children
	 system "go", "generate", "github.com/mayflower/docker-ls/lib"
	 cd "src/github.com/mayflower/docker-ls" do
	 system "go", "build", "-o", bin/"docker-ls", "./cli/docker-ls"
	 system "go", "build", "-o", bin/"docker-rm", "./cli/docker-rm"
	 prefix.install_metafiles
