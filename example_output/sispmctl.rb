name :
	 Sispmctl
homepage :
	 https://sispmctl.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/sispmctl/sispmctl/sispmctl-4.0/sispmctl-4.0.tar.gz
description :
	 Control Gembird SIS-PM programmable power outlet strips
build_deps :
	 pkg-config
link_deps :
	 libusb-compat
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
