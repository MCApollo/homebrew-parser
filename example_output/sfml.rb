name :
	 Sfml
homepage :
	 https://www.sfml-dev.org/
url :
	 https://www.sfml-dev.org/files/SFML-2.4.2-sources.zip
description :
	 Multi-media library with bindings for multiple languages
build_deps :
	 cmake
	 doxygen
link_deps :
	 flac
	 freetype
	 jpeg
	 libogg
	 libvorbis
	 :macos
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "CMakeLists.txt",
	 "if(SFML_OS_LINUX OR SFML_OS_FREEBSD)",
	 "if(SFML_OS_LINUX OR SFML_OS_FREEBSD OR SFML_OS_MACOSX)"
	 rm_rf Dir["extlibs/*"] - ["extlibs/headers"]
	 system "cmake", ".", *std_cmake_args,
	 "-DSFML_INSTALL_PKGCONFIG_FILES=TRUE",
	 "-DSFML_BUILD_DOC=TRUE"
	 system "make", "install"
