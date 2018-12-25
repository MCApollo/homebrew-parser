name :
	 Dehydrated
homepage :
	 https://dehydrated.de
url :
	 https://github.com/lukas2511/dehydrated/archive/v0.6.2.tar.gz
description :
	 LetsEncrypt/acme client implemented as a shell-script
build_deps :
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
	 (buildpath/"src/github.com/lukas2511/dehydrated").install buildpath.children
	 cd "src/github.com/lukas2511/dehydrated" do
	 bin.install "dehydrated"
	 prefix.install_metafiles
	 end
