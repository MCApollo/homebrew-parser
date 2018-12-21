name :
	 Librtlsdr
homepage :
	 https://sdr.osmocom.org/trac/wiki/rtl-sdr
url :
	 https://github.com/steve-m/librtlsdr/archive/0.6.0.tar.gz
description :
	 Use Realtek DVT-T dongles as a cheap SDR
build_deps :
	 cmake
	 pkg-config
link_deps :
	 libusb
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
