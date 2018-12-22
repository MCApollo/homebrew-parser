name :
	 Cataclysm
homepage :
	 https://github.com/CleverRaven/Cataclysm-DDA
url :
	 https://github.com/CleverRaven/Cataclysm-DDA/archive/0.C.tar.gz
description :
	 Fork/variant of Cataclysm Roguelike
build_deps :
	 pkg-config
link_deps :
	 gettext
	 libogg
	 libvorbis
	 lua
	 sdl2
	 sdl2_image
	 sdl2_mixer
	 sdl2_ttf
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 args = %W[
	 NATIVE=osx
	 RELEASE=1
	 OSX_MIN=#{MacOS.version}
	 LUA=1
	 USE_HOME_DIR=1
	 TILES=1
	 SOUND=1
	 ]
	 args << "CLANG=1" if ENV.compiler == :clang
	 system "make", *args
	 libexec.install "cataclysm-tiles", "data", "gfx", "lua"
	 inreplace "cataclysm-launcher" do |s|
	 s.change_make_var! "DIR", libexec
	 end
	 bin.install "cataclysm-launcher" => "cataclysm"
