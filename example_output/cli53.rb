name :
	 Cli53
homepage :
	 https://github.com/barnybug/cli53
url :
	 https://github.com/barnybug/cli53/archive/0.8.12.tar.gz
description :
	 Command-line tool for Amazon Route 53
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
	 mkdir_p buildpath/"src/github.com/barnybug"
	 ln_s buildpath, buildpath/"src/github.com/barnybug/cli53"
	 system "make", "build"
	 bin.install "cli53"
