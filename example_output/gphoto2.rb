name :
	 Gphoto2
homepage :
	 http://www.gphoto.org/
url :
	 https://downloads.sourceforge.net/project/gphoto/gphoto/2.5.20/gphoto2-2.5.20.tar.bz2
description :
	 Command-line interface to libgphoto2
build_deps :
	 pkg-config
link_deps :
	 jpeg
	 libgphoto2
	 popt
	 readline
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
