name :
	 ReattachToUserNamespace
homepage :
	 https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
url :
	 https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard/archive/v2.7.tar.gz
description :
	 Reattach process (e.g., tmux) to background
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "reattach-to-user-namespace"
