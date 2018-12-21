name :
	 Libimobiledevice
homepage :
	 https://www.libimobiledevice.org/
url :
	 https://www.libimobiledevice.org/downloads/libimobiledevice-1.2.0.tar.bz2
description :
	 Library to communicate with iOS devices natively
build_deps :
	 pkg-config
link_deps :
	 libplist
	 libtasn1
	 openssl
	 usbmuxd
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--without-cython",
	 "--enable-debug-code"
	 system "make", "install"
