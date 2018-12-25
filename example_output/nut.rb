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
optional_deps :
conflicts :
	 rhino
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if build.head?
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 system "./autogen.sh"
	 end
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--localstatedir=#{var}",
	 "--with-macosx_ups",
	 "--with-openssl",
	 "--with-serial",
	 "--with-usb",
	 "--without-avahi",
	 "--without-cgi",
	 "--without-dev",
	 "--without-doc",
	 "--without-ipmi",
	 "--without-libltdl",
	 "--without-neon",
	 "--without-nss",
	 "--without-powerman",
	 "--without-snmp",
	 "--without-wrap"
	 system "make", "install"
