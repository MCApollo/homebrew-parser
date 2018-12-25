name :
	 Xsw
homepage :
	 https://code.google.com/archive/p/xsw/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/xsw/xsw-0.3.5.tar.gz
description :
	 Slide show presentation tool
build_deps :
link_deps :
	 sdl
	 sdl_gfx
	 sdl_image
	 sdl_ttf
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
