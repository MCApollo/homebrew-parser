name :
	 Owfs
homepage :
	 http://owfs.org/
url :
	 https://downloads.sourceforge.net/project/owfs/owfs/3.2p2/owfs-3.2p2.tar.gz
description :
	 Monitor and control physical environment using Dallas/Maxim 1-wire system
build_deps :
	 pkg-config
link_deps :
	 libftdi
	 libusb
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-swig",
	 "--disable-owtcl",
	 "--disable-zero",
	 "--disable-owpython",
	 "--disable-owperl",
	 "--disable-swig",
	 "--enable-ftdi",
	 "--enable-usb",
	 "--prefix=#{prefix}"
	 system "make", "install"
