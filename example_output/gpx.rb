name :
	 Gpx
homepage :
	 https://github.com/markwal/GPX/blob/master/README.md
url :
	 https://github.com/markwal/GPX/archive/2.5.2.tar.gz
description :
	 Gcode to x3g converter for 3D printers running Sailfish
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
