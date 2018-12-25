name :
	 Libmodplug
homepage :
	 https://modplug-xmms.sourceforge.io/
url :
	 https://downloads.sourceforge.net/modplug-xmms/libmodplug/0.8.9.0/libmodplug-0.8.9.0.tar.gz
description :
	 Library from the Modplug-XMMS project
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['testmod']
	 ['https://api.modarchive.org/downloads.php?moduleid=60395#2ND_PM.S3M']
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
