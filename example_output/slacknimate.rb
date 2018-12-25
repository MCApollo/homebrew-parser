name :
	 Slacknimate
homepage :
	 https://github.com/mroth/slacknimate
url :
	 https://github.com/mroth/slacknimate/archive/v1.0.1.tar.gz
description :
	 Text animation for Slack messages
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
	 pkgpath = buildpath/"src/github.com/mroth"
	 pkgpath.install Dir["*"]
	 cd pkgpath do
	 system "make"
	 bin.install "bin/slacknimate"
	 prefix.install_metafiles
	 end
