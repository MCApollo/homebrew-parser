name :
	 Megacmd
homepage :
	 https://github.com/t3rm1n4l/megacmd
url :
	 https://github.com/t3rm1n4l/megacmd/archive/0.015.tar.gz
description :
	 Command-line client for mega.co.nz storage service
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
	 (buildpath/"src/github.com/t3rm1n4l/megacmd").install buildpath.children
	 cd "src/github.com/t3rm1n4l/megacmd" do
	 system "go", "build", "-o", bin/"megacmd"
	 prefix.install_metafiles
	 end
