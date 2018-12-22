name :
	 Leaps
homepage :
	 https://github.com/jeffail/leaps
url :
	 https://github.com/Jeffail/leaps.git
description :
	 Collaborative web-based text editing service written in Golang
build_deps :
	 dep
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/jeffail/leaps").install buildpath.children
	 cd "src/github.com/jeffail/leaps" do
	 system "dep", "ensure", "-vendor-only"
	 system "go", "build", "-o", bin/"leaps", "./cmd/leaps"
	 prefix.install_metafiles
	 end
