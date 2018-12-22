name :
	 Td
homepage :
	 https://github.com/Swatto/td
url :
	 https://github.com/Swatto/td/archive/1.4.0.tar.gz
description :
	 Your todo list in your terminal
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV["GOBIN"] = bin
	 (buildpath/"src/github.com/Swatto/td").install buildpath.children
	 cd "src/github.com/Swatto/td" do
	 system "go", "install"
	 prefix.install_metafiles
	 end
