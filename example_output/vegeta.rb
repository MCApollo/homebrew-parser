name :
	 Vegeta
homepage :
	 https://github.com/tsenart/vegeta
url :
	 https://github.com/tsenart/vegeta.git
description :
	 HTTP load testing tool and library
build_deps :
	 dep
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/tsenart/vegeta").install buildpath.children
	 ENV.prepend_create_path "PATH", buildpath/"bin"
	 cd "src/github.com/tsenart/vegeta" do
	 system "make", "vegeta"
	 bin.install "vegeta"
	 prefix.install_metafiles
