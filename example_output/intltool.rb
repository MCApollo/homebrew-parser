name :
	 Intltool
homepage :
	 https://wiki.freedesktop.org/www/Software/intltool
url :
	 https://launchpad.net/intltool/trunk/0.51.0/+download/intltool-0.51.0.tar.gz
description :
	 String tool
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-silent-rules"
	 system "make", "install"
