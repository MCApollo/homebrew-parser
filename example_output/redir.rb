name :
	 Redir
homepage :
	 http://sammy.net/~sammy/hacks/
url :
	 https://github.com/TracyWebTech/redir/archive/2.2.1-9.tar.gz
description :
	 Port redirector
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "redir"
	 man1.install "redir.man"
