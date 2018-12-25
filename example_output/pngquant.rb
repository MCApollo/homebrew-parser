name :
	 Pngquant
homepage :
	 https://pngquant.org/
url :
	 https://pngquant.org/pngquant-2.12.2-src.tar.gz
description :
	 PNG image optimizing utility
build_deps :
	 pkg-config
	 rust
link_deps :
	 libpng
	 little-cms2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cargo", "install", "--root", prefix, "--path", "."
	 man1.install "pngquant.1"
