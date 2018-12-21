name :
	 GitMultipush
homepage :
	 https://github.com/gavinbeatty/git-multipush
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/git-multipush/git-multipush-2.3.tar.bz2
description :
	 Push a branch to multiple remotes in one command
build_deps :
	 asciidoc
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make" if build.head?
	 system "make", "prefix=#{prefix}", "install"
