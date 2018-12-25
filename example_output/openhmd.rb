name :
	 Openhmd
homepage :
	 http://openhmd.net
url :
	 https://github.com/OpenHMD/OpenHMD/archive/0.2.0.tar.gz
description :
	 Free and open source API and drivers for immersive technology
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 hidapi
optional_deps :
conflicts :
	 cspice
	 libftdi0
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 (pkgshare/"tests").install bin/"unittests"
