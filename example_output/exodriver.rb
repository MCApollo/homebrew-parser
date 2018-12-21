name :
	 Exodriver
homepage :
	 https://labjack.com/support/linux-and-mac-os-x-drivers
url :
	 https://github.com/labjack/exodriver/archive/v2.5.3.tar.gz
description :
	 Thin interface to LabJack devices
build_deps :
link_deps :
	 libusb
conflicts :
patches :
EOF_patch :
install :
	 system "make", "-C", "liblabjackusb", "install",
	 "HEADER_DESTINATION=#{include}", "DESTINATION=#{lib}"
	 ENV.prepend "CPPFLAGS", "-I#{include}"
	 ENV.prepend "LDFLAGS", "-L#{lib}"
	 system "make", "-C", "examples/Modbus"
	 pkgshare.install "examples/Modbus/testModbusFunctions"
