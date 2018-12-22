name :
	 Cointop
homepage :
	 https://cointop.sh
url :
	 https://github.com/miguelmota/cointop/archive/1.0.6.tar.gz
description :
	 Interactive terminal based UI application for tracking cryptocurrencies
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/miguelmota/cointop").install buildpath.children
	 cd "src/github.com/miguelmota/cointop" do
	 system "go", "build", "-o", bin/"cointop"
	 prefix.install_metafiles
	 end
