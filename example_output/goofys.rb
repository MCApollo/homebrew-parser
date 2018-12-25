name :
	 Goofys
homepage :
	 https://github.com/kahing/goofys
url :
	 https://github.com/kahing/goofys.git
description :
	 Filey-System interface to Amazon S3
build_deps :
	 go
link_deps :
	 :osxfuse
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 contents = Dir["*"]
	 gopath = buildpath/"gopath"
	 (gopath/"src/github.com/kahing/goofys").install contents
	 ENV["GOPATH"] = gopath
	 Language::Go.stage_deps resources, gopath/"src"
	 cd gopath/"src/github.com/kahing/goofys" do
	 commit = Utils.popen_read("git rev-parse HEAD").chomp
	 system "go", "build", "-o", "goofys", "-ldflags",
	 "-X main.Version=#{commit}"
	 bin.install "goofys"
	 prefix.install_metafiles
	 end
