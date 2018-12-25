name :
	 Garmintools
homepage :
	 https://code.google.com/archive/p/garmintools/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/garmintools/garmintools-0.10.tar.gz
description :
	 Interface to the Garmin Forerunner GPS units
build_deps :
link_deps :
	 libusb-compat
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
