name :
	 T1lib
homepage :
	 https://www.t1lib.org/
url :
	 https://www.ibiblio.org/pub/linux/libs/graphics/t1lib-5.1.2.tar.gz
description :
	 C library to generate/rasterize bitmaps from Type 1 fonts
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
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "without_doc"
	 system "make", "install"
	 share.install "Fonts" => "fonts"
