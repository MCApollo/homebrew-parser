name :
	 Annie
homepage :
	 https://github.com/iawia002/annie
url :
	 https://github.com/iawia002/annie/archive/0.8.5.tar.gz
description :
	 Fast, simple and clean video downloader
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
	 (buildpath/"src/github.com/iawia002/annie").install buildpath.children
	 cd "src/github.com/iawia002/annie" do
	 system "go", "build", "-o", bin/"annie"
	 prefix.install_metafiles
	 end
