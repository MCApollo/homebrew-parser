name :
	 Gron
homepage :
	 https://github.com/tomnomnom/gron
url :
	 https://github.com/tomnomnom/gron/archive/v0.6.0.tar.gz
description :
	 Make JSON greppable
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
	 (buildpath/"src/github.com/tomnomnom").mkpath
	 ln_s buildpath, buildpath/"src/github.com/tomnomnom/gron"
	 Language::Go.stage_deps resources, buildpath/"src"
	 system "go", "build", "-o", bin/"gron"
