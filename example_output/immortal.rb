name :
	 Immortal
homepage :
	 https://immortal.run/
url :
	 https://github.com/immortal/immortal/archive/0.22.0.tar.gz
description :
	 OS agnostic (*nix) cross-platform supervisor
build_deps :
	 dep
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/immortal/immortal").install buildpath.children
	 cd "src/github.com/immortal/immortal" do
	 system "dep", "ensure", "-vendor-only"
	 ldflags = "-s -w -X main.version=#{version}"
	 system "go", "build", "-ldflags", ldflags, "-o", "#{bin}/immortal", "cmd/immortal/main.go"
	 system "go", "build", "-ldflags", ldflags, "-o", "#{bin}/immortalctl", "cmd/immortalctl/main.go"
	 system "go", "build", "-ldflags", ldflags, "-o", "#{bin}/immortaldir", "cmd/immortaldir/main.go"
	 man8.install Dir["man/*.8"]
	 prefix.install_metafiles
	 end
