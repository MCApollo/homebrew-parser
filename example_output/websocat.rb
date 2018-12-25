name :
	 Websocat
homepage :
	 https://github.com/vi/websocat
url :
	 https://github.com/vi/websocat/archive/v1.2.0.tar.gz
description :
	 Command-line client for WebSockets
build_deps :
	 pkg-config
	 rust
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cargo", "install", "--root", prefix,
	 "--path", ".",
	 "--features", "ssl"
