name :
	 Gx
homepage :
	 https://github.com/whyrusleeping/gx
url :
	 https://github.com/whyrusleeping/gx/archive/v0.13.0.tar.gz
description :
	 The language-agnostic, universal package manager
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 mkdir_p "src/github.com/whyrusleeping"
	 ln_s buildpath, "src/github.com/whyrusleeping/gx"
	 Language::Go.stage_deps resources, buildpath/"src"
	 system "go", "build", "-o", bin/"gx"
