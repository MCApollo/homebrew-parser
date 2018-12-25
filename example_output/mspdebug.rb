name :
	 Mspdebug
homepage :
	 https://dlbeer.co.nz/mspdebug/
url :
	 https://github.com/dlbeer/mspdebug/archive/v0.25.tar.gz
description :
	 Debugger for use with MSP430 MCUs
build_deps :
link_deps :
	 hidapi
	 libusb-compat
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.append_to_cflags "-I#{Formula["hidapi"].opt_include}/hidapi"
	 system "make", "PREFIX=#{prefix}", "install"
