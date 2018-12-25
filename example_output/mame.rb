name :
	 Mame
homepage :
	 https://mamedev.org/
url :
	 https://github.com/mamedev/mame/archive/mame0204.tar.gz
description :
	 Multiple Arcade Machine Emulator
build_deps :
	 pkg-config
	 sphinx-doc
link_deps :
	 flac
	 jpeg
	 lua
	 :macos
	 portaudio
	 portmidi
	 sdl2
	 sqlite
	 utf8proc
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "scripts/src/osd/sdl.lua", "--static", ""
	 ENV.append "CPPFLAGS", "-I#{Formula["lua"].opt_include}/lua"
	 system "make", "USE_LIBSDL=1",
	 "USE_SYSTEM_LIB_EXPAT=1",
	 "USE_SYSTEM_LIB_ZLIB=1",
	 "USE_SYSTEM_LIB_JPEG=1",
	 "USE_SYSTEM_LIB_FLAC=1",
	 "USE_SYSTEM_LIB_LUA=1",
	 "USE_SYSTEM_LIB_SQLITE3=1",
	 "USE_SYSTEM_LIB_PORTMIDI=1",
	 "USE_SYSTEM_LIB_PORTAUDIO=1",
	 "USE_SYSTEM_LIB_UTF8PROC=1"
	 bin.install "mame64" => "mame"
	 cd "docs" do
	 system "make", "text"
	 doc.install Dir["build/text/*"]
	 system "make", "man"
	 man1.install "build/man/MAME.1" => "mame.1"
	 end
	 pkgshare.install %w[artwork bgfx hash ini keymaps plugins samples uismall.bdf]
