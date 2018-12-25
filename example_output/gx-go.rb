name :
	 GxGo
homepage :
	 https://github.com/whyrusleeping/gx-go
url :
	 https://github.com/whyrusleeping/gx-go/archive/v1.7.0.tar.gz
description :
	 Tool to use with the gx package manager for packages written in go
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
	 mkdir_p "src/github.com/whyrusleeping"
	 ln_s buildpath, "src/github.com/whyrusleeping/gx-go"
	 Language::Go.stage_deps resources, buildpath/"src"
	 system "go", "build", "-o", bin/"gx-go"
