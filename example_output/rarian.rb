name :
	 Rarian
homepage :
	 https://rarian.freedesktop.org/
url :
	 https://rarian.freedesktop.org/Releases/rarian-0.8.1.tar.bz2
description :
	 Documentation metadata library
build_deps :
link_deps :
optional_deps :
conflicts :
	 scrollkeeper
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
