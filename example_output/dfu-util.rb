name :
	 DfuUtil
homepage :
	 https://dfu-util.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/dfu-util/dfu-util-0.9.tar.gz
description :
	 USB programmer
build_deps :
	 pkg-config
link_deps :
	 libusb
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
