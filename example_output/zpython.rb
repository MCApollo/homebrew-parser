name :
	 Zpython
homepage :
	 https://bitbucket.org/ZyX_I/zsh
url :
description :
	 Embeds a Python interpreter into zsh
build_deps :
	 autoconf
link_deps :
	 zsh
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %w[
	 --disable-gdbm
	 --enable-zpython
	 --with-tcsetpgrp
	 DL_EXT=bundle
	 ]
	 system "autoreconf"
	 system "./configure", *args
	 inreplace "Makefile", "subdir in Src Doc;", "subdir in Src;"
	 system "make"
	 (lib/"zpython/zsh").install "Src/Modules/zpython.bundle"
