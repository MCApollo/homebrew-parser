name :
	 DvdVr
homepage :
	 https://www.pixelbeat.org/programs/dvd-vr/
url :
	 https://www.pixelbeat.org/programs/dvd-vr/dvd-vr-0.9.7.tar.gz
description :
	 Utility to identify and extract recordings from DVD-VR files
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}", "install"
