name :
	 Ogmtools
homepage :
	 https://www.bunkus.org/videotools/ogmtools/
url :
	 https://www.bunkus.org/videotools/ogmtools/ogmtools-1.5.tar.bz2
description :
	 OGG media streams manipulation tools
build_deps :
link_deps :
	 libogg
	 libvorbis
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/e4957439/ogmtools/common.h.diff
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
