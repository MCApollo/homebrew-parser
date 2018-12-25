name :
	 Pgweb
homepage :
	 https://sosedoff.github.io/pgweb/
url :
	 https://github.com/sosedoff/pgweb/archive/v0.10.0.tar.gz
description :
	 Web-based PostgreSQL database browser
build_deps :
	 go
	 go-bindata
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
	 (buildpath/"src/github.com/sosedoff/pgweb").install buildpath.children
	 cd "src/github.com/sosedoff/pgweb" do
	 inreplace "Makefile", "go get", ""
	 system "make", "build"
	 bin.install "pgweb"
	 prefix.install_metafiles
	 end
