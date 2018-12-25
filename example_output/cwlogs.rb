name :
	 Cwlogs
homepage :
	 https://github.com/segmentio/cwlogs
url :
	 https://github.com/segmentio/cwlogs/archive/v1.2.0.tar.gz
description :
	 CLI tool for reading logs from Cloudwatch Logs
build_deps :
	 go
	 govendor
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
	 ENV["GOOS"] = "darwin"
	 ENV["GOARCH"] = "amd64"
	 ENV["CGO_ENABLED"] = "0"
	 path = buildpath/"src/github.com/segmentio/cwlogs"
	 path.install Dir["{*,.git}"]
	 cd "src/github.com/segmentio/cwlogs" do
	 system "govendor", "sync"
	 system "go", "build", "-o", bin/"cwlogs",
	 "-ldflags", "-X main.Version=#{version}"
	 prefix.install_metafiles
	 end
