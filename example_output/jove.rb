name :
	 Jove
homepage :
	 https://directory.fsf.org/wiki/Jove
url :
	 http://ftp.cs.toronto.edu/cs/ftp/pub/hugh/jove-dev/jove4.16.0.73.tgz
description :
	 Emacs-style editor with vi-like memory, CPU, and size requirements
build_deps :
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/3cada68f/jove/patch-getline.diff
EOF_patch :
install :
	 bin.mkpath
	 man1.mkpath
	 (lib/"jove").mkpath
	 system "make", "install", "JOVEHOME=#{prefix}", "MANDIR=#{man1}"
