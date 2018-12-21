name :
	 Pms
homepage :
	 https://pms.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/pms/pms/0.42/pms-0.42.tar.bz2
description :
	 Practical Music Search, an ncurses-based MPD client
build_deps :
	 pkg-config
link_deps :
	 gettext
	 glib
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
