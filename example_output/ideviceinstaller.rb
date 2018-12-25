name :
	 Ideviceinstaller
homepage :
	 https://www.libimobiledevice.org/
url :
	 https://www.libimobiledevice.org/downloads/ideviceinstaller-1.1.0.tar.bz2
description :
	 Cross-platform library for communicating with iOS devices
build_deps :
	 pkg-config
link_deps :
	 libimobiledevice
	 libzip
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
