name :
	 Libngspice
homepage :
	 https://ngspice.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/ngspice/ng-spice-rework/28/ngspice-28.tar.gz
description :
	 Spice circuit simulator as shared library
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
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}", "--disable-debug",
	 "--disable-dependency-tracking", "--with-ngshared", "--enable-cider",
	 "--enable-xspice"
	 system "make", "install"
