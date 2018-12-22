name :
	 GtkGnutella
homepage :
	 https://gtk-gnutella.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/gtk-gnutella/gtk-gnutella/1.1.13/gtk-gnutella-1.1.13.tar.xz
description :
	 Share files in a peer-to-peer (P2P) network
build_deps :
	 pkg-config
link_deps :
	 gtk+
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 if MacOS.version == :el_capitan && MacOS::Xcode.installed? && MacOS::Xcode.version >= "8.0"
	 inreplace "Configure", "ret = clock_gettime(CLOCK_REALTIME, &tp);",
	 "ret = undefinedgibberish(CLOCK_REALTIME, &tp);"
	 end
	 system "./build.sh", "--prefix=#{prefix}", "--disable-nls"
	 system "make", "install"
	 rm_rf share/"pixmaps"
	 rm_rf share/"applications"
