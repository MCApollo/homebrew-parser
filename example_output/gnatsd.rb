name :
	 Gnatsd
homepage :
	 https://nats.io
url :
	 https://github.com/nats-io/gnatsd/archive/v1.3.0.tar.gz
description :
	 Lightweight cloud messaging system
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
	 mkdir_p "src/github.com/nats-io"
	 ln_s buildpath, "src/github.com/nats-io/gnatsd"
	 system "go", "build", "-o", bin/"gnatsd", "main.go"
