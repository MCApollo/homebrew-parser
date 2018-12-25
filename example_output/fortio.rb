name :
	 Fortio
homepage :
	 https://fortio.org/
url :
	 https://github.com/fortio/fortio.git
description :
	 HTTP and gRPC load testing and visualization tool and server
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
	 (buildpath/"src/fortio.org/fortio").install buildpath.children
	 cd "src/fortio.org/fortio" do
	 system "make", "official-build", "OFFICIAL_BIN=#{bin}/fortio",
	 "LIB_DIR=#{lib}"
	 lib.install "ui/static", "ui/templates"
	 prefix.install_metafiles
	 end
