name :
	 Quasi88
homepage :
	 https://www.eonet.ne.jp/~showtime/quasi88/
url :
	 https://www.eonet.ne.jp/~showtime/quasi88/release/quasi88-0.6.4.tgz
description :
	 PC-8801 emulator
build_deps :
link_deps :
	 sdl
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 X11_VERSION=
	 SDL_VERSION=1
	 ARCH=macosx
	 SOUND_SDL=1
	 LD=#{ENV.cxx}
	 CXX=#{ENV.cxx}
	 CXXLIBS=
	 ]
	 system "make", *args
	 bin.install "quasi88.sdl" => "quasi88"
