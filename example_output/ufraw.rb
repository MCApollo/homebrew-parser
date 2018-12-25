name :
	 Ufraw
homepage :
	 https://ufraw.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/ufraw/ufraw/ufraw-0.22/ufraw-0.22.tar.gz
description :
	 Unidentified Flying RAW: RAW image processing utility
build_deps :
	 pkg-config
link_deps :
	 dcraw
	 gettext
	 glib
	 jasper
	 jpeg
	 libpng
	 libtiff
	 little-cms2
optional_deps :
	 exiv2
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/b8ed064/ufraw/jpeg9.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/d5bf686c74/ufraw/high_sierra.patch
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--without-gtk",
	 "--without-gimp"
	 system "make", "install"
	 (share/"pixmaps").rmtree
