name :
	 Dockward
homepage :
	 https://github.com/abiosoft/dockward
url :
	 https://github.com/abiosoft/dockward/archive/0.0.4.tar.gz
description :
	 Port forwarding tool for Docker containers
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOBIN"] = bin
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/abiosoft").mkpath
	 ln_s buildpath, buildpath/"src/github.com/abiosoft/dockward"
	 Language::Go.stage_deps resources, buildpath/"src"
	 system "go", "install", "github.com/abiosoft/dockward"
