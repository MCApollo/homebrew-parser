name :
	 Dopewars
homepage :
	 https://dopewars.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/dopewars/dopewars/1.5.12/dopewars-1.5.12.tar.gz
description :
	 Drug Wars
build_deps :
	 pkg-config
link_deps :
	 glib
conflicts :
patches :
EOF_patch :
install :
	 inreplace "src/Makefile.in", "$(dopewars_DEPENDENCIES)", ""
	 inreplace "ltmain.sh", "need_relink=yes", "need_relink=no"
	 inreplace "src/plugins/Makefile.in", "LIBADD =", "LIBADD = -module -avoid-version"
	 system "./configure", "--disable-gui-client",
	 "--disable-gui-server",
	 "--enable-plugins",
	 "--enable-networking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--disable-debug",
	 "--disable-dependency-tracking"
	 system "make", "install"
