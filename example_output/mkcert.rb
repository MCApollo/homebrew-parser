name :
	 Mkcert
homepage :
	 https://github.com/FiloSottile/mkcert
url :
	 https://github.com/FiloSottile/mkcert/archive/v1.1.2.tar.gz
description :
	 Simple tool to make locally trusted development certificates
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
	 (buildpath/"src/github.com/FiloSottile/mkcert").install buildpath.children
	 cd "src/github.com/FiloSottile/mkcert" do
	 system "go", "build", "-o", bin/"mkcert"
	 prefix.install_metafiles
	 end
