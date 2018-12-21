name :
	 ChrubyFish
homepage :
	 https://github.com/JeanMertz/chruby-fish#readme
url :
	 https://github.com/JeanMertz/chruby-fish/archive/v0.8.2.tar.gz
description :
	 Thin wrapper around chruby to make it work with the Fish shell
build_deps :
link_deps :
	 chruby
	 fish
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
