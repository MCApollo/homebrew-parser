name :
	 Libgphoto2
homepage :
	 http://www.gphoto.org/proj/libgphoto2/
url :
	 https://downloads.sourceforge.net/project/gphoto/libgphoto/2.5.20/libgphoto2-2.5.20.tar.bz2
description :
	 Gphoto2 digital camera library
build_deps :
	 pkg-config
link_deps :
	 gd
	 libtool
	 libusb-compat
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fvi" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
