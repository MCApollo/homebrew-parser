name :
	 Libspnav
homepage :
	 https://spacenav.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/spacenav/spacenav%20library%20%28SDK%29/libspnav%200.2.3/libspnav-0.2.3.tar.gz
description :
	 Client library for connecting to 3Dconnexion's 3D input devices
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
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --disable-x11
	 ]
	 system "./configure", *args
	 system "make", "install"
