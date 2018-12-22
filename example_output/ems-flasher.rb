name :
	 EmsFlasher
homepage :
	 https://lacklustre.net/projects/ems-flasher/
url :
	 https://lacklustre.net/projects/ems-flasher/ems-flasher-0.03.tgz
description :
	 Software for flashing the EMS Gameboy USB cart
build_deps :
	 pkg-config
link_deps :
	 libusb
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 system "./config.sh", "--prefix", prefix
	 man1.mkpath
	 system "make", "install"
	 else
	 system "make"
	 bin.install "ems-flasher"
	 end
