name :
	 Gource
homepage :
	 https://github.com/acaudwell/Gource
url :
	 https://github.com/acaudwell/Gource/releases/download/gource-0.49/gource-0.49.tar.gz
description :
	 Version Control Visualization Tool
build_deps :
	 glm
	 pkg-config
link_deps :
	 boost
	 freetype
	 glew
	 libpng
	 pcre
	 sdl2
	 sdl2_image
optional_deps :
	 :x11
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.libcxx
	 system "autoreconf", "-f", "-i" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-boost=#{Formula["boost"].opt_prefix}",
	 "--without-x"
	 system "make", "install"
