name :
	 Mussh
homepage :
	 https://mussh.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/mussh/mussh/1.0/mussh-1.0.tgz
description :
	 Multi-host SSH wrapper
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.install "mussh"
	 man1.install "mussh.1"
