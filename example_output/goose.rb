name :
	 Goose
homepage :
	 https://github.com/pressly/goose
url :
	 https://github.com/pressly/goose/archive/v2.3.0.tar.gz
description :
	 Go Language's command-line interface for database migrations
build_deps :
	 dep
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/pressly/goose").install buildpath.children
	 cd "src/github.com/pressly/goose" do
	 system "dep", "ensure"
	 system "go", "build", "-o", bin/"goose", ".../cmd/goose"
	 prefix.install_metafiles
	 end
