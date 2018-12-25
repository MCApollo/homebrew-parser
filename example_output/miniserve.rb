name :
	 Miniserve
homepage :
	 https://github.com/svenstaro/miniserve
url :
	 https://github.com/svenstaro/miniserve/archive/v0.2.1.tar.gz
description :
	 High performance static file server
build_deps :
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
	 system "cargo", "install", "--root", prefix, "--path", "."
