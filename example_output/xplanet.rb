name :
	 Xplanet
homepage :
	 https://xplanet.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/xplanet/xplanet/1.3.1/xplanet-1.3.1.tar.gz
description :
	 Create HQ wallpapers of planet Earth
build_deps :
	 pkg-config
link_deps :
	 freetype
	 giflib
	 jpeg
	 libpng
	 libtiff
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/f952f1d/xplanet/xplanet-1.3.1-ntimes.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/master/xplanet/xplanet-1.3.1-giflib5.patch
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-aqua",
	 "--without-cspice",
	 "--without-cygwin",
	 "--without-gif",
	 "--without-jpeg",
	 "--without-libpng",
	 "--without-libtiff",
	 "--without-pango",
	 "--without-pnm",
	 "--without-x",
	 "--without-xscreensaver"
	 system "make", "install"
