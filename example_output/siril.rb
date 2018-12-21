name :
	 Siril
homepage :
	 https://free-astro.org/index.php/Siril
url :
	 https://free-astro.org/download/siril-0.9.9.tar.bz2
description :
	 Astronomical image processing tool
build_deps :
	 autoconf
	 automake
	 intltool
	 libtool
	 pkg-config
link_deps :
	 adwaita-icon-theme
	 cfitsio
	 ffms2
	 fftw
	 gcc
	 gnuplot
	 gsl
	 gtk-mac-integration
	 jpeg
	 libconfig
	 libraw
	 librsvg
	 libsvg
	 netpbm
	 opencv
	 openjpeg
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 ENV.append_to_cflags "-I#{HOMEBREW_PREFIX}/include"
	 system "./autogen.sh", "--prefix=#{prefix}", "--enable-openmp"
	 system "make", "install"
