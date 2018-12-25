name :
	 Oauth2Proxy
homepage :
	 https://github.com/bitly/oauth2_proxy
url :
	 https://github.com/bitly/oauth2_proxy/archive/v2.2.tar.gz
description :
	 Reverse proxy for authenticating users via OAuth 2 providers
build_deps :
	 go
	 gpm
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 mkdir_p "#{buildpath}/src/github.com/bitly"
	 ln_s buildpath, "#{buildpath}/src/github.com/bitly/oauth2_proxy"
	 ENV["GOPATH"] = buildpath
	 system "gpm", "install"
	 system "go", "build", "-o", "#{bin}/oauth2_proxy"
	 (etc/"oauth2_proxy").install "contrib/oauth2_proxy.cfg.example"
