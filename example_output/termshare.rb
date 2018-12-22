name :
	 Termshare
homepage :
	 https://github.com/progrium/termshare
url :
	 https://github.com/progrium/termshare/archive/v0.2.0.tar.gz
description :
	 Interactive or view-only terminal sharing via client or web
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 path = buildpath/"src/github.com/progrium/termshare"
	 path.install Dir["*"]
	 Language::Go.stage_deps resources, buildpath/"src"
	 cd path do
	 inreplace "termshare.go", "code.google.com/p/go.net/websocket",
	 "golang.org/x/net/websocket"
	 system "go", "build", "-o", bin/"termshare"
	 prefix.install_metafiles
	 end
