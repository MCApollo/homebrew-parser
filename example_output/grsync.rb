name :
	 Grsync
homepage :
	 http://www.opbyte.it/grsync/
url :
	 https://downloads.sourceforge.net/project/grsync/grsync-1.2.6.tar.gz
description :
	 GUI for rsync
build_deps :
	 intltool
	 pkg-config
link_deps :
	 gettext
	 gtk+
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-unity",
	 "--prefix=#{prefix}"
	 system "make", "install"
