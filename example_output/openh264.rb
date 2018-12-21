name :
	 Openh264
homepage :
	 https://www.openh264.org/
url :
	 https://github.com/cisco/openh264/archive/v1.8.0.tar.gz
description :
	 H.264 codec from Cisco
build_deps :
	 nasm
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install-shared", "PREFIX=#{prefix}"
	 chmod 0444, "#{lib}/libopenh264.dylib"
