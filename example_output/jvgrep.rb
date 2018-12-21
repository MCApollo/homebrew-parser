name :
	 Jvgrep
homepage :
	 https://github.com/mattn/jvgrep
url :
	 https://github.com/mattn/jvgrep/archive/v5.6.0.tar.gz
description :
	 Grep for Japanese users of Vim
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 mkdir_p buildpath/"src/github.com/mattn"
	 ln_s buildpath, buildpath/"src/github.com/mattn/jvgrep"
	 Language::Go.stage_deps resources, buildpath/"src"
	 system "go", "build", "-o", bin/"jvgrep"
