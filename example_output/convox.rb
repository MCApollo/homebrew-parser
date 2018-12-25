name :
	 Convox
homepage :
	 https://convox.com/
url :
	 https://github.com/convox/rack/archive/20181211140404.tar.gz
description :
	 Command-line interface for the Rack PaaS on AWS
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
	 (buildpath/"src/github.com/convox/rack").install Dir["*"]
	 system "go", "build", "-ldflags=-X main.version=#{version}",
	 "-o", bin/"convox", "-v", "github.com/convox/rack/cmd/convox"
	 prefix.install_metafiles
