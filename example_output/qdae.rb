name :
	 Qdae
homepage :
	 https://www.seasip.info/Unix/QDAE/
url :
	 https://www.seasip.info/Unix/QDAE/qdae-0.0.10.tar.gz
description :
	 Quick and Dirty Apricot Emulator
build_deps :
link_deps :
	 libxml2
	 sdl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
