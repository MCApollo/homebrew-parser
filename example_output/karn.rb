name :
	 Karn
homepage :
	 https://github.com/prydonius/karn
url :
	 https://github.com/prydonius/karn/archive/v0.0.4.tar.gz
description :
	 Manage multiple Git identities
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/prydonius/karn").install buildpath.children
	 cd "src/github.com/prydonius/karn" do
	 system "go", "build", "-o", bin/"karn", "./cmd/karn/karn.go"
	 prefix.install_metafiles
	 end
