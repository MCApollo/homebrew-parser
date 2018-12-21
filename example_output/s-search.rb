name :
	 SSearch
homepage :
	 https://github.com/zquestz/s
url :
	 https://github.com/zquestz/s/archive/v0.5.13.tar.gz
description :
	 Web search from the terminal
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 Language::Go.stage_deps resources, buildpath/"src"
	 cd("src/github.com/FiloSottile/gvt") { system "go", "install" }
	 (buildpath/"src/github.com/zquestz").mkpath
	 ln_s buildpath, "src/github.com/zquestz/s"
	 system buildpath/"bin/gvt", "restore"
	 system "go", "build", "-o", bin/"s"
