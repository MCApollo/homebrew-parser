name :
	 Termrec
homepage :
	 https://angband.pl/termrec.html
url :
	 https://github.com/kilobyte/termrec/archive/v0.18.tar.gz
description :
	 Record videos of terminal output
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 xz
optional_deps :
conflicts :
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
