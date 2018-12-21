name :
	 Wdfs
homepage :
	 http://noedler.de/projekte/wdfs/
url :
	 http://noedler.de/projekte/wdfs/wdfs-1.4.2.tar.gz
description :
	 Webdav file system
build_deps :
	 pkg-config
link_deps :
	 glib
	 neon
	 :osxfuse
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
