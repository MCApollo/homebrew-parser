name :
	 Pcb
homepage :
	 http://pcb.geda-project.org/
url :
	 https://downloads.sourceforge.net/project/pcb/pcb/pcb-4.1.2/pcb-4.1.2.tar.gz
description :
	 Interactive printed circuit board editor
build_deps :
	 intltool
	 pkg-config
link_deps :
	 dbus
	 gd
	 gettext
	 glib
	 gtk+
	 gtkglext
conflicts :
	 gts
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-update-desktop-database",
	 "--disable-update-mime-database",
	 "--disable-gl",
	 "--without-x"
	 system "make", "install"
