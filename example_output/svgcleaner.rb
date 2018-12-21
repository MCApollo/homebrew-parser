name :
	 Svgcleaner
homepage :
	 https://github.com/RazrFalcon/svgcleaner
url :
	 https://github.com/RazrFalcon/svgcleaner/archive/v0.9.5.tar.gz
description :
	 Cleans your SVG files by removing unnecessary data
build_deps :
	 rust
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cargo", "install", "--root", prefix, "--path", "."
