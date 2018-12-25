name :
	 Stout
homepage :
	 https://github.com/cloudflare/Stout
url :
	 https://github.com/cloudflare/Stout/archive/v1.3.1.tar.gz
description :
	 Reliable static website deploy tool
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
	 mkdir_p buildpath/"src/github.com/cloudflare"
	 ln_s buildpath, buildpath/"src/github.com/cloudflare/stout"
	 system "go", "build", "-o", bin/"stout", "-v", "github.com/cloudflare/stout/src"
