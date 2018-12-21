name :
	 Genact
homepage :
	 https://github.com/svenstaro/genact
url :
	 https://github.com/svenstaro/genact/archive/0.6.0.tar.gz
description :
	 Nonsense activity generator
build_deps :
	 rust
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cargo", "install", "--root", prefix, "--path", "."
