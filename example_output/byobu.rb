name :
	 Byobu
homepage :
	 http://byobu.co/
url :
	 https://launchpad.net/byobu/trunk/5.127/+download/byobu_5.127.orig.tar.gz
description :
	 Text-based window manager and terminal multiplexer
build_deps :
link_deps :
	 coreutils
	 gnu-sed
	 newt
	 tmux
conflicts :
	 ctail
patches :
EOF_patch :
install :
	 if build.head?
	 cp "./debian/changelog", "./ChangeLog"
	 system "autoreconf", "-fvi"
