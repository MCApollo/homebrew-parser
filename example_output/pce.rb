name :
	 Pce
homepage :
	 http://www.hampa.ch/pce/
url :
	 http://www.hampa.ch/pub/pce/pce-0.2.2.tar.gz
description :
	 PC emulator
build_deps :
link_deps :
	 readline
	 sdl
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
	 "--without-x",
	 "--enable-readline"
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
