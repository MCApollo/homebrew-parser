name :
	 Vifm
homepage :
	 https://vifm.info/
url :
	 https://github.com/vifm/vifm/releases/download/v0.9.1/vifm-0.9.1.tar.bz2
description :
	 Ncurses based file manager with vi like keybindings
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--without-gtk",
	 "--without-libmagic",
	 "--without-X11"
	 system "make"
	 system "make", "check"
	 ENV.deparallelize { system "make", "install" }
