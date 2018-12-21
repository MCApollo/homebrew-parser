name :
	 Onscripter
homepage :
	 https://onscripter.osdn.jp/
url :
	 https://onscripter.osdn.jp/onscripter-20170814.tar.gz
description :
	 NScripter-compatible visual novel engine
build_deps :
	 pkg-config
link_deps :
	 jpeg
	 lua
	 sdl
	 sdl_image
	 sdl_mixer
	 sdl_ttf
	 smpeg
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/eeb2de3/onscripter/jpeg9.patch
EOF_patch :
install :
	 incs = [
	 `pkg-config --cflags sdl SDL_ttf SDL_image SDL_mixer`.chomp,
	 `smpeg-config --cflags`.chomp,
	 "-I#{Formula["jpeg"].include}",
	 "-I#{Formula["lua"].opt_include}/lua",
	 ]
	 libs = [
	 `pkg-config --libs sdl SDL_ttf SDL_image SDL_mixer`.chomp,
	 `smpeg-config --libs`.chomp,
	 "-ljpeg",
	 "-lbz2",
	 "-L#{Formula["lua"].opt_lib} -llua",
	 ]
	 defs = %w[
	 -DMACOSX
	 -DUSE_CDROM
	 -DUSE_LUA
	 -DUTF8_CAPTION
	 -DUTF8_FILESYSTEM
	 ]
	 ext_objs = ["LUAHandler.o"]
	 k = %w[INCS LIBS DEFS EXT_OBJS]
	 v = [incs, libs, defs, ext_objs].map { |x| x.join(" ") }
	 args = k.zip(v).map { |x| x.join("=") }
	 system "make", "-f", "Makefile.MacOSX", *args
	 bin.install %w[onscripter sardec nsadec sarconv nsaconv]
