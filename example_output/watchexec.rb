name :
	 Watchexec
homepage :
	 https://github.com/watchexec/watchexec
url :
	 https://github.com/watchexec/watchexec/archive/1.9.2.tar.gz
description :
	 Execute commands when watched files change
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
	 man1.install "doc/watchexec.1"
