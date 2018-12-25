name :
	 Algernon
homepage :
	 https://algernon.roboticoverlords.org/
url :
	 https://github.com/xyproto/algernon.git
description :
	 Pure Go web server with Lua, Markdown, HTTP/2 and template support
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
	 (buildpath/"src/github.com/xyproto/algernon").install buildpath.children
	 cd "src/github.com/xyproto/algernon" do
	 system "go", "build", "-o", "algernon"
	 bin.install "desktop/mdview"
	 bin.install "algernon"
	 prefix.install_metafiles
	 end
