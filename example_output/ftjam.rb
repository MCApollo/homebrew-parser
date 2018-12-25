name :
	 Ftjam
homepage :
	 https://www.freetype.org/jam/
url :
	 https://downloads.sourceforge.net/project/freetype/ftjam/2.5.2/ftjam-2.5.2.tar.bz2
description :
	 Build tool that can be used as a replacement for Make
build_deps :
link_deps :
optional_deps :
conflicts :
	 jam
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
