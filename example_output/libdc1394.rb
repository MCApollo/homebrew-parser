name :
	 Libdc1394
homepage :
	 https://damien.douxchamps.net/ieee1394/libdc1394/
url :
	 https://downloads.sourceforge.net/project/libdc1394/libdc1394-2/2.2.2/libdc1394-2.2.2.tar.gz
description :
	 Provides API for IEEE 1394 cameras
build_deps :
link_deps :
	 sdl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/b8275aa07f/libdc1394/capture.patch
EOF_patch :
install :
	 Dir.chdir("libdc1394") if build.head?
	 system "autoreconf", "-i", "-s" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-examples",
	 "--disable-sdltest"
	 system "make", "install"
