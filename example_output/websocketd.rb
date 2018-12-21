name :
	 Websocketd
homepage :
	 http://websocketd.com
url :
	 https://github.com/joewalnes/websocketd/archive/v0.3.0.tar.gz
description :
	 WebSockets the Unix way
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 mkdir_p buildpath/"src/github.com/joewalnes/"
	 ln_sf buildpath, buildpath/"src/github.com/joewalnes/websocketd"
	 Language::Go.stage_deps resources, buildpath/"src"
	 system "go", "build", "-ldflags", "-X main.version=#{version}", "-o", bin/"websocketd",
	 "main.go", "config.go", "help.go", "version.go"
	 man1.install "release/websocketd.man" => "websocketd.1"
