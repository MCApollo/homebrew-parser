name :
	 Libdvdnav
homepage :
	 https://www.videolan.org/developers/libdvdnav.html
url :
	 https://download.videolan.org/pub/videolan/libdvdnav/6.0.0/libdvdnav-6.0.0.tar.bz2
description :
	 DVD navigation library
build_deps :
	 pkg-config
link_deps :
	 libdvdread
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-if" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
