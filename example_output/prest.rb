name :
	 Prest
homepage :
	 https://github.com/prest/prest
url :
	 https://github.com/prest/prest/archive/v0.3.4.tar.gz
description :
	 Serve a RESTful API from any PostgreSQL database
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
	 (buildpath/"src/github.com/prest/prest").install buildpath.children
	 cd "src/github.com/prest/prest" do
	 system "go", "build", "-ldflags",
	 "-X github.com/prest/prest/vendor/github.com/prest/helpers.PrestVersionNumber=#{version}",
	 "-o", bin/"prest"
	 prefix.install_metafiles
	 end
