name :
	 TtyClock
homepage :
	 https://github.com/xorg62/tty-clock
url :
	 https://github.com/xorg62/tty-clock/archive/v2.3.tar.gz
description :
	 Digital clock in ncurses
build_deps :
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.append "LDFLAGS", "-lncurses"
	 system "make", "PREFIX=#{prefix}"
	 system "make", "PREFIX=#{prefix}", "install"
