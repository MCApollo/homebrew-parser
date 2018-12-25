name :
	 Certstrap
homepage :
	 https://github.com/square/certstrap
url :
	 https://github.com/square/certstrap/archive/v1.1.1.tar.gz
description :
	 Tools to bootstrap CAs, certificate requests, and signed certificates
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
	 (buildpath/"src/github.com/square").mkpath
	 ln_s buildpath, "src/github.com/square/certstrap"
	 system "go", "build", "-o", bin/"certstrap"
