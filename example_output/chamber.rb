name :
	 Chamber
homepage :
	 https://github.com/segmentio/chamber
url :
	 https://github.com/segmentio/chamber/archive/v2.3.2.tar.gz
description :
	 CLI for managing secrets through AWS SSM Parameter Store
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
	 path = buildpath/"src/github.com/segmentio/chamber"
	 path.install Dir["{*,.git}"]
	 cd "src/github.com/segmentio/chamber" do
	 system "govendor", "sync"
	 system "go", "build", "-o", bin/"chamber",
	 "-ldflags", "-X main.Version=#{version}"
	 prefix.install_metafiles
	 end
