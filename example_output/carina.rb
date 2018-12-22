name :
	 Carina
homepage :
	 https://github.com/getcarina/carina
url :
	 https://github.com/getcarina/carina.git
description :
	 Command-line client for Carina
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV.prepend_create_path "PATH", buildpath/"bin"
	 carinapath = buildpath/"src/github.com/getcarina/carina"
	 carinapath.install Dir["{*,.git}"]
	 cd carinapath do
	 system "make", "get-deps"
	 system "make", "local", "VERSION=#{version}"
	 bin.install "carina"
	 prefix.install_metafiles
	 end
