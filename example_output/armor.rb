name :
	 Armor
homepage :
	 https://github.com/labstack/armor
url :
	 https://github.com/labstack/armor/archive/v0.4.13.tar.gz
description :
	 Uncomplicated, modern HTTP server
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
	 ENV["GO111MODULE"] = "on"
	 ENV["GOPATH"] = buildpath
	 armorpath = buildpath/"src/github.com/labstack/armor"
	 armorpath.install buildpath.children
	 cd armorpath do
	 system "go", "build", "-o", bin/"armor", "cmd/armor/main.go"
	 prefix.install_metafiles
	 end
