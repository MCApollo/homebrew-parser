name :
	 Hyperfine
homepage :
	 https://github.com/sharkdp/hyperfine
url :
	 https://github.com/sharkdp/hyperfine/archive/v1.5.0.tar.gz
description :
	 Command-line benchmarking tool
build_deps :
	 rust
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cargo", "install", "--root", prefix, "--path", "."
