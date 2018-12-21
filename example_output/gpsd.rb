name :
	 Gpsd
homepage :
	 http://catb.org/gpsd/
url :
	 https://download.savannah.gnu.org/releases/gpsd/gpsd-3.17.tar.gz
description :
	 Global Positioning System (GPS) daemon
build_deps :
	 scons
link_deps :
	 libusb
conflicts :
patches :
EOF_patch :
install :
	 scons "chrpath=False", "python=False", "strip=False", "prefix=#{prefix}/"
	 scons "install"
