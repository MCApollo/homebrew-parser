name :
	 Libdvdread
homepage :
	 https://www.videolan.org/developers/libdvdnav.html
url :
	 https://download.videolan.org/pub/videolan/libdvdread/6.0.0/libdvdread-6.0.0.tar.bz2
description :
	 C library for reading DVD-video images
build_deps :
link_deps :
	 libdvdcss
conflicts :
patches :
EOF_patch :
install :
	 ENV.append "CFLAGS", "-DHAVE_DVDCSS_DVDCSS_H"
	 ENV.append "LDFLAGS", "-ldvdcss"
	 system "autoreconf", "-if" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
