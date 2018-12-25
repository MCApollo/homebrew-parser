name :
	 Libspectrum
homepage :
	 https://fuse-emulator.sourceforge.io/libspectrum.php
url :
	 https://downloads.sourceforge.net/project/fuse-emulator/libspectrum/1.4.4/libspectrum-1.4.4.tar.gz
description :
	 Support library for ZX Spectrum emulator
build_deps :
	 pkg-config
link_deps :
	 audiofile
	 glib
	 libgcrypt
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
