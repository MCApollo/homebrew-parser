name :
	 TeensyLoaderCli
homepage :
	 https://www.pjrc.com/teensy/loader_cli.html
url :
	 https://github.com/PaulStoffregen/teensy_loader_cli/archive/2.1.tar.gz
description :
	 Command-line integration for Teensy USB development boards
build_deps :
link_deps :
	 libusb-compat
conflicts :
patches :
EOF_patch :
install :
	 ENV["OS"] = "MACOSX"
	 if build.with? "libusb-compat"
	 ENV["USE_LIBUSB"] = "YES"
	 else
	 ENV["SDK"] = MacOS.sdk_path || "/"
