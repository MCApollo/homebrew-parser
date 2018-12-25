name :
	 Freeimage
homepage :
	 https://sourceforge.net/projects/freeimage
url :
	 https://downloads.sourceforge.net/project/freeimage/Source%20Distribution/3.18.0/FreeImage3180.zip
description :
	 Library for FreeImage, a dependency-free graphics library
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/4dcf528/freeimage/3.17.0.patch
EOF_patch :
install :
	 system "make", "-f", "Makefile.gnu"
	 system "make", "-f", "Makefile.gnu", "install", "PREFIX=#{prefix}"
	 system "make", "-f", "Makefile.fip"
	 system "make", "-f", "Makefile.fip", "install", "PREFIX=#{prefix}"
