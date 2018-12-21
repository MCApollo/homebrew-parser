name :
	 Nut
homepage :
	 https://networkupstools.org/
url :
	 https://networkupstools.org/source/2.7/nut-2.7.4.tar.gz
description :
	 Network UPS Tools: Support for various power devices
build_deps :
	 pkg-config
link_deps :
	 libusb-compat
	 openssl
conflicts :
	 rhino
patches :
EOF_patch :
install :
	 if build.head?
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 system "./autogen.sh"
