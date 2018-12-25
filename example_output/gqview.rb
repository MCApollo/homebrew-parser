name :
	 Gqview
homepage :
	 https://gqview.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/gqview/gqview/2.0.4/gqview-2.0.4.tar.gz
description :
	 Image browser
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
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
