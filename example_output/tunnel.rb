name :
	 Tunnel
homepage :
	 https://labstack.com/docs/tunnel
url :
	 https://github.com/labstack/tunnel-client/archive/v0.2.12.tar.gz
description :
	 Expose local servers to internet securely
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
	 system "go", "build", "-o", bin/"tunnel", "./cmd/tunnel"
	 prefix.install_metafiles
