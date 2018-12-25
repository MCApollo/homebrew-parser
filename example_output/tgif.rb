name :
	 Tgif
homepage :
	 http://bourbon.usc.edu/tgif/
url :
	 https://downloads.sourceforge.net/project/tgif/tgif/4.2.5/tgif-QPL-4.2.5.tar.gz
description :
	 Xlib-based interactive 2D drawing tool
build_deps :
link_deps :
	 :x11
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
