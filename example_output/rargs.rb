name :
	 Rargs
homepage :
	 https://github.com/lotabout/rargs
url :
	 https://github.com/lotabout/rargs/archive/v0.2.2.tar.gz
description :
	 Util like xargs + awk with pattern matching support
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
