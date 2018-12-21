name :
	 NatsStreamingServer
homepage :
	 https://nats.io
url :
	 https://github.com/nats-io/nats-streaming-server/archive/v0.11.2.tar.gz
description :
	 Lightweight cloud messaging system
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 mkdir_p "src/github.com/nats-io"
	 ln_s buildpath, "src/github.com/nats-io/nats-streaming-server"
	 buildfile = buildpath/"src/github.com/nats-io/nats-streaming-server/nats-streaming-server.go"
	 system "go", "build", "-v", "-o", bin/"nats-streaming-server", buildfile
