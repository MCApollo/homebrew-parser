name :
	 Openmotif
homepage :
	 https://motif.ics.com/motif
url :
	 https://downloads.sourceforge.net/project/motif/Motif%202.3.8%20Source%20Code/motif-2.3.8.tar.gz
description :
	 LGPL release of the Motif toolkit
build_deps :
	 pkg-config
link_deps :
	 fontconfig
	 freetype
	 jpeg
	 libpng
	 :x11
optional_deps :
conflicts :
	 lesstif
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules"
	 system "make"
	 system "make", "install"
	 mv man3/"Core.3", man3/"openmotif-Core.3"
