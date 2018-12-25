name :
	 Gtkdatabox
homepage :
	 https://sourceforge.net/projects/gtkdatabox/
url :
	 https://downloads.sourceforge.net/project/gtkdatabox/gtkdatabox/0.9.3.0/gtkdatabox-0.9.3.0.tar.gz
description :
	 Widget for live display of large amounts of changing data
build_deps :
	 pkg-config
link_deps :
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
	 "--prefix=#{prefix}"
	 system "make", "install"
