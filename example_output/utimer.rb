name :
	 Utimer
homepage :
	 https://launchpad.net/utimer
url :
	 https://launchpad.net/utimer/0.4/0.4/+download/utimer-0.4.tar.gz
description :
	 Multifunction timer tool
build_deps :
	 intltool
	 pkg-config
link_deps :
	 gettext
	 glib
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
