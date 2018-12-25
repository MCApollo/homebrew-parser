name :
	 MesalibGlw
homepage :
	 https://www.mesa3d.org
url :
	 https://mesa.freedesktop.org/archive/glw/glw-8.0.0.tar.bz2
description :
	 Open-source implementation of the OpenGL specification
build_deps :
	 pkg-config
link_deps :
	 :x11
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
