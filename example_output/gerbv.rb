name :
	 Gerbv
homepage :
	 http://gerbv.gpleda.org/
url :
	 https://downloads.sourceforge.net/project/gerbv/gerbv/gerbv-2.6.0/gerbv-2.6.0.tar.gz
description :
	 Gerber (RS-274X) viewer
build_deps :
	 pkg-config
link_deps :
	 gtk+
conflicts :
patches :
EOF_patch :
install :
	 ENV.append "CPPFLAGS", "-DQUARTZ"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-update-desktop-database"
	 system "make", "install"
