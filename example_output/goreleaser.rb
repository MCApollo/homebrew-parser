name :
	 Goreleaser
homepage :
	 https://goreleaser.com/
url :
	 https://github.com/goreleaser/goreleaser/archive/v0.95.0.tar.gz
description :
	 Deliver Go binaries as fast and easily as possible
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
	 (buildpath/"src/github.com/goreleaser/goreleaser").install buildpath.children
	 cd "src/github.com/goreleaser/goreleaser" do
	 system "go", "build", "-ldflags", "-X main.version=#{version}",
	 "-o", bin/"goreleaser"
	 prefix.install_metafiles
	 end
