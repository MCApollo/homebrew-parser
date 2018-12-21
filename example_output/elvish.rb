name :
	 Elvish
homepage :
	 https://github.com/elves/elvish
url :
	 https://github.com/elves/elvish/archive/0.12.tar.gz
description :
	 Friendly and expressive shell
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/elves/elvish").install buildpath.children
	 cd "src/github.com/elves/elvish" do
	 system "go", "build", "-ldflags",
	 "-X github.com/elves/elvish/buildinfo.Version=#{version}", "-o",
	 bin/"elvish"
	 prefix.install_metafiles
