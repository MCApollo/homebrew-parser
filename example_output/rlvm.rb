name :
	 Rlvm
homepage :
	 http://www.rlvm.net/
url :
	 https://github.com/eglaysher/rlvm/archive/release-0.14.tar.gz
description :
	 RealLive interpreter for VisualArts games
build_deps :
	 pkg-config
	 scons
link_deps :
	 boost
	 freetype
	 gettext
	 glew
	 jpeg
	 libogg
	 libpng
	 libvorbis
	 mad
	 sdl
	 sdl_image
	 sdl_mixer
	 sdl_ttf
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/eglaysher/rlvm/commit/668863d2222b962ee8e7d9829e972ef05c990302.diff?full_index=1
EOF_patch :
install :
	 inreplace "SConstruct" do |s|
	 s.gsub! /("z")/, '\1, "bz2"'
	 s.gsub! /(CheckForSystemLibrary\(config, library_dict), subcomponents/, '\1, []'
	 s.gsub! "jpeglib.h", "jconfig.h"
	 s.gsub! /(msgfmt)/, "#{Formula["gettext"].bin}/\\1"
	 end
	 inreplace "SConscript.cocoa" do |s|
	 s.gsub! /(static_env\.ParseConfig)\("sdl-config --static-libs", MergeEverythingButSDLMain\)/,
	 '\1("pkg-config --libs sdl SDL_image SDL_mixer SDL_ttf freetype2").Append(FRAMEWORKS=["OpenGL"])'
	 s.gsub! /(full_static_build) = True/, '\1 = False'
	 end
	 scons "--release"
	 prefix.install "build/rlvm.app"
	 bin.write_exec_script "#{prefix}/rlvm.app/Contents/MacOS/rlvm"
