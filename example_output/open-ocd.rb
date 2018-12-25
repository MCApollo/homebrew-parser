name :
	 OpenOcd
homepage :
	 https://sourceforge.net/projects/openocd/
url :
	 https://downloads.sourceforge.net/project/openocd/openocd/0.10.0/openocd-0.10.0.tar.bz2
description :
	 On-chip debugging, in-system programming and boundary-scan testing
build_deps :
	 pkg-config
link_deps :
	 hidapi
	 libftdi
	 libusb
	 libusb-compat
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["CCACHE"] = "none"
	 system "./bootstrap", "nosubmodule" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-buspirate",
	 "--enable-stlink",
	 "--enable-dummy",
	 "--enable-jtag_vpi",
	 "--enable-remote-bitbang"
	 system "make", "install"
