name :
	 Pixman
homepage :
	 https://cairographics.org/
url :
	 https://cairographics.org/releases/pixman-0.36.0.tar.gz
description :
	 Low-level library for pixel manipulation
build_deps :
	 pkg-config
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-gtk",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
