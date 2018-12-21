name :
	 Logstalgia
homepage :
	 https://logstalgia.io/
url :
	 https://github.com/acaudwell/Logstalgia/releases/download/logstalgia-1.1.2/logstalgia-1.1.2.tar.gz
description :
	 Web server access log visualizer with retro style
build_deps :
	 boost
	 glm
	 pkg-config
link_deps :
	 freetype
	 glew
	 libpng
	 pcre
	 sdl2
	 sdl2_image
conflicts :
patches :
EOF_patch :
install :
	 ENV.libcxx
	 ENV.append "CXXFLAGS", "-I#{HOMEBREW_PREFIX}/include"
	 system "autoreconf", "-f", "-i" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--without-x"
	 system "make"
	 system "make", "install"
