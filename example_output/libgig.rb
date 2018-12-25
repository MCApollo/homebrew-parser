name :
	 Libgig
homepage :
	 https://www.linuxsampler.org/libgig/
url :
	 https://download.linuxsampler.org/packages/libgig-4.1.0.tar.bz2
description :
	 Library for Gigasampler and DLS (Downloadable Sounds) Level 1/2 files
build_deps :
	 pkg-config
link_deps :
	 libsndfile
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 ENV.append "LDFLAGS", "-framework CoreFoundation"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
