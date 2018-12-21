name :
	 Dssim
homepage :
	 https://github.com/kornelski/dssim
url :
	 https://github.com/kornelski/dssim/archive/2.9.7.tar.gz
description :
	 RGBA Structural Similarity Rust implementation
build_deps :
	 rust
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cargo", "install", "--root", prefix, "--path", "."
