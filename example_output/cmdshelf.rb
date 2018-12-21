name :
	 Cmdshelf
homepage :
	 https://github.com/toshi0383/cmdshelf
url :
	 https://github.com/toshi0383/cmdshelf/archive/2.0.2.tar.gz
description :
	 Better scripting life with cmdshelf
build_deps :
	 rust
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cargo", "install", "--root", prefix, "--path", "."
	 man.install Dir["docs/man/*"]
	 bash_completion.install "cmdshelf-completion.bash"
