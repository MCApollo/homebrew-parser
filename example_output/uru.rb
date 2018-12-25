name :
	 Uru
homepage :
	 https://bitbucket.org/jonforums/uru
url :
	 https://bitbucket.org/jonforums/uru/get/v0.8.5.tar.gz
description :
	 Use multiple rubies on multiple platforms
build_deps :
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
	 (buildpath/"src/bitbucket.org/jonforums/uru").install Dir["*"]
	 system "go", "build", "-ldflags", "-s", "bitbucket.org/jonforums/uru/cmd/uru"
	 bin.install "uru" => "uru_rt"
