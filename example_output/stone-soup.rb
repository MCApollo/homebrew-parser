name :
	 StoneSoup
homepage :
	 https://crawl.develz.org/
url :
	 https://crawl.develz.org/release/0.22/stone_soup-0.22.1.tar.xz
description :
	 Dungeon Crawl Stone Soup: a roguelike game
build_deps :
	 pkg-config
link_deps :
	 lua@5.1
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 cd "source" do
	 args = %W[
	 prefix=#{prefix}
	 DATADIR=data
	 NO_PKGCONFIG=
	 BUILD_ZLIB=
	 BUILD_SQLITE=yes
	 BUILD_FREETYPE=
	 BUILD_LIBPNG=
	 BUILD_LUA=y
	 BUILD_SDL2=
	 BUILD_SDL2MIXER=
	 BUILD_SDL2IMAGE=
	 BUILD_PCRE=
	 USE_PCRE=y
	 ]
	 args << "NO_RDYNAMIC=y" unless ENV.compiler == :clang
	 #
	 devdir = MacOS::Xcode.prefix.to_s
	 devdir += "/" if MacOS.version >= :mavericks && !MacOS::Xcode.installed?
	 system "make", "install",
	 "DEVELOPER_DIR=#{devdir}", "SDKROOT=#{MacOS.sdk_path}",
	 "SDK_VER=#{MacOS.version}", "MARCH=#{MacOS.preferred_arch}",
	 *args
