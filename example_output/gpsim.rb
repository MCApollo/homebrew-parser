name :
	 Gpsim
homepage :
	 https://gpsim.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/gpsim/gpsim/0.30.0/gpsim-0.30.0.tar.gz
description :
	 Simulator for Microchip's PIC microcontrollers
build_deps :
	 gputils
	 pkg-config
link_deps :
	 glib
	 popt
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-gui",
	 "--disable-shared",
	 "--prefix=#{prefix}"
	 system "make", "all"
	 system "make", "install"
