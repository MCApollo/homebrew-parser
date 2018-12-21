name :
	 Libcanberra
homepage :
	 http://0pointer.de/lennart/projects/libcanberra/
url :
	 http://0pointer.de/lennart/projects/libcanberra/libcanberra-0.30.tar.xz
description :
	 Implementation of XDG Sound Theme and Name Specifications
build_deps :
	 pkg-config
link_deps :
	 libtool
	 libvorbis
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}", "--no-create"
	 inreplace "config.status", "-Wl,--as-needed -Wl,--gc-sections", ""
	 system "./config.status"
	 system "make", "install"
