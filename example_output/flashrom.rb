name :
	 Flashrom
homepage :
	 https://flashrom.org/
url :
	 https://download.flashrom.org/releases/flashrom-1.0.tar.bz2
description :
	 Identify, read, write, verify, and erase flash chips
build_deps :
	 pkg-config
link_deps :
	 libftdi0
	 libusb-compat
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["CONFIG_GFXNVIDIA"] = "0"
	 ENV["CONFIG_NIC3COM"] = "0"
	 ENV["CONFIG_NICREALTEK"] = "0"
	 ENV["CONFIG_NICNATSEMI"] = "0"
	 ENV["CONFIG_NICINTEL"] = "0"
	 ENV["CONFIG_NICINTEL_SPI"] = "0"
	 ENV["CONFIG_NICINTEL_EEPROM"] = "0"
	 ENV["CONFIG_OGP_SPI"] = "0"
	 ENV["CONFIG_SATAMV"] = "0"
	 ENV["CONFIG_SATASII"] = "0"
	 ENV["CONFIG_DRKAISER"] = "0"
	 ENV["CONFIG_RAYER_SPI"] = "0"
	 ENV["CONFIG_INTERNAL"] = "0"
	 ENV["CONFIG_IT8212"] = "0"
	 ENV["CONFIG_ATAHPT"] = "0"
	 ENV["CONFIG_ATAVIA"] = "0"
	 system "make", "DESTDIR=#{prefix}", "PREFIX=/", "install"
	 mv sbin, bin
