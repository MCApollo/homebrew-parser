name :
	 Rkflashtool
homepage :
	 https://sourceforge.net/projects/rkflashtool/
url :
	 https://downloads.sourceforge.net/project/rkflashtool/rkflashtool-6.1/rkflashtool-6.1-src.tar.bz2
description :
	 Tools for flashing Rockchip devices
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
	 system "make", "install", "PREFIX=#{prefix}"
