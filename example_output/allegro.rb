name :
	 Allegro
homepage :
	 https://liballeg.org/
url :
	 https://github.com/liballeg/allegro5/releases/download/5.2.4.0/allegro-5.2.4.0.tar.gz
description :
	 C/C++ multimedia library for cross-platform game development
build_deps :
	 cmake
link_deps :
	 flac
	 freetype
	 libogg
	 libvorbis
	 opusfile
	 physfs
	 theora
	 webp
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args, "-DWANT_DOCS=OFF"
	 system "make", "install"
	 end
