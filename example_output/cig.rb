name :
	 Cig
homepage :
	 https://github.com/stevenjack/cig
url :
	 https://github.com/stevenjack/cig/archive/v0.1.5.tar.gz
description :
	 CLI app for checking the state of your git repositories
build_deps :
	 go
	 godep
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 mkdir_p buildpath/"src/github.com/stevenjack/"
	 ln_sf buildpath, buildpath/"src/github.com/stevenjack/cig"
	 Language::Go.stage_deps resources, buildpath/"src"
	 system "godep", "go", "build", "-o", "cig", "."
	 bin.install "cig"
