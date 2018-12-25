name :
	 Micro
homepage :
	 https://github.com/zyedidia/micro
url :
	 https://github.com/zyedidia/micro/releases/download/v1.4.1/micro-1.4.1-src.tar.gz
description :
	 Modern and intuitive terminal-based text editor
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
	 (buildpath/"src/github.com/zyedidia/micro").install buildpath.children
	 cd "src/github.com/zyedidia/micro" do
	 system "make", "build-quick"
	 bin.install "micro"
	 prefix.install_metafiles
	 end
