name :
	 Chordii
homepage :
	 https://www.vromans.org/johan/projects/Chordii/
url :
	 https://downloads.sourceforge.net/project/chordii/chordii/4.5/chordii-4.5.3.tar.gz
description :
	 Text file to music sheet converter
build_deps :
link_deps :
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
