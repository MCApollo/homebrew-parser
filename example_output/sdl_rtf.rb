name :
	 SdlRtf
homepage :
	 https://www.libsdl.org/projects/SDL_rtf/
url :
	 https://www.libsdl.org/projects/SDL_rtf/release/SDL_rtf-0.1.0.tar.gz
description :
	 Sample library to display Rich Text Format (RTF) documents
build_deps :
link_deps :
	 sdl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
