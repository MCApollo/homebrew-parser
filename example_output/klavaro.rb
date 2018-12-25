name :
	 Klavaro
homepage :
	 https://klavaro.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/klavaro/klavaro-3.03.tar.bz2
description :
	 Free touch typing tutor program
build_deps :
	 intltool
	 pkg-config
link_deps :
	 gtk+3
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
