name :
	 Tealdeer
homepage :
	 https://github.com/dbrgn/tealdeer
url :
	 https://github.com/dbrgn/tealdeer/archive/v1.1.0.tar.gz
description :
	 Very fast implementation of tldr in Rust
build_deps :
	 rust
link_deps :
optional_deps :
conflicts :
	 tldr
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cargo", "install", "--root", prefix,
	 "--path", "."
	 bash_completion.install "bash_tealdeer"
