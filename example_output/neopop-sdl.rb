name :
	 NeopopSdl
homepage :
	 https://nih.at/NeoPop-SDL/
url :
	 https://nih.at/NeoPop-SDL/NeoPop-SDL-0.2.tar.bz2
description :
	 NeoGeo Pocket emulator
build_deps :
link_deps :
	 libpng
	 sdl
	 sdl_net
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-i" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
