name :
	 Srmio
homepage :
	 http://www.zuto.de/project/srmio/
url :
	 http://www.zuto.de/project/files/srmio/srmio-0.1.1~git1.tar.gz
description :
	 C library to access the PowerControl of a SRM bike power meter
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 chmod 0755, "genautomake.sh"
	 system "./genautomake.sh"
	 end
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
