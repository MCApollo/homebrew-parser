name :
	 GameMusicEmu
homepage :
	 https://bitbucket.org/mpyne/game-music-emu
url :
	 https://bitbucket.org/mpyne/game-music-emu/downloads/game-music-emu-0.6.2.tar.xz
description :
	 Videogame music file emulator collection
build_deps :
	 cmake
link_deps :
	 sdl
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 if build.with? "sdl"
	 cd "player" do
	 system "make"
	 dylib_id = MachO::MachOFile.new("#{buildpath}/gme/libgme.0.dylib").dylib_id
	 MachO::Tools.change_install_name("gme_player", dylib_id, "#{lib}/libgme.0.dylib")
	 bin.install "gme_player"
	 end
