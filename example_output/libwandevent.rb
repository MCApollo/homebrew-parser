name :
	 Libwandevent
homepage :
	 https://research.wand.net.nz/software/libwandevent.php
url :
	 https://research.wand.net.nz/software/libwandevent/libwandevent-3.0.2.tar.gz
description :
	 API for developing event-driven programs
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
