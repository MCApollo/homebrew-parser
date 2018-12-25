name :
	 Stern
homepage :
	 https://github.com/wercker/stern
url :
	 https://github.com/wercker/stern/archive/1.10.0.tar.gz
description :
	 Tail multiple Kubernetes pods & their containers
build_deps :
	 go
	 govendor
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 contents = Dir["{*,.git,.gitignore}"]
	 gopath = buildpath/"gopath"
	 (gopath/"src/github.com/wercker/stern").install contents
	 ENV["GOPATH"] = gopath
	 ENV.prepend_create_path "PATH", gopath/"bin"
	 cd gopath/"src/github.com/wercker/stern" do
	 system "govendor", "sync"
	 system "go", "build", "-o", "bin/stern"
	 bin.install "bin/stern"
	 prefix.install_metafiles
	 end
