name :
	 Adplug
homepage :
	 https://adplug.github.io
url :
	 https://github.com/adplug/adplug/releases/download/adplug-2.3.1/adplug-2.3.1.tar.bz2
description :
	 Free, hardware independent AdLib sound player library
build_deps :
	 pkg-config
link_deps :
	 libbinio
optional_deps :
conflicts :
resource :
	 ['ksms']
	 ['http://advsys.net/ken/ksmsongs.zip']
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
