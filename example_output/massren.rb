name :
	 Massren
homepage :
	 https://github.com/laurent22/massren
url :
	 https://github.com/laurent22/massren/archive/v1.5.4.tar.gz
description :
	 Easily rename multiple files using your text editor
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/laurent22/massren").install buildpath.children
	 cd "src/github.com/laurent22/massren" do
	 system "go", "build", "-o", bin/"massren"
	 prefix.install_metafiles
