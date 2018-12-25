name :
	 NestopiaUe
homepage :
	 http://0ldsk00l.ca/nestopia/
url :
	 https://downloads.sourceforge.net/project/nestopiaue/1.49/nestopia-1.49.tgz
description :
	 Nestopia UE (Undead Edition): NES emulator
build_deps :
	 autoconf
	 autoconf-archive
	 automake
	 pkg-config
link_deps :
	 libao
	 libarchive
	 libepoxy
	 sdl2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--datarootdir=#{pkgshare}"
	 system "make", "install"
