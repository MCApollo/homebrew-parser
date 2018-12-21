name :
	 LibxdgBasedir
homepage :
	 https://github.com/devnev/libxdg-basedir
url :
	 https://github.com/devnev/libxdg-basedir/archive/libxdg-basedir-1.2.0.tar.gz
description :
	 C implementation of the XDG Base Directory specifications
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
