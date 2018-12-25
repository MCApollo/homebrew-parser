name :
	 Ifuse
homepage :
	 https://www.libimobiledevice.org/
url :
	 https://github.com/libimobiledevice/ifuse/archive/1.1.3.tar.gz
description :
	 FUSE module for iPhone and iPod Touch devices
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 glib
	 libimobiledevice
	 :osxfuse
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
