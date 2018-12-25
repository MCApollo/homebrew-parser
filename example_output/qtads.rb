name :
	 Qtads
homepage :
	 https://qtads.sourceforge.io/
url :
description :
	 TADS multimedia interpreter
build_deps :
	 pkg-config
link_deps :
	 qt
	 sdl2
	 sdl2_mixer
	 sdl_sound
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/realnc/qtads/commit/46701a2.patch?full_index=1
	 https://raw.githubusercontent.com/Homebrew/formula-patches/e189341/qtads/xcode9.diff
EOF_patch :
install :
	 sdl_sound_include = Formula["sdl_sound"].opt_include
	 inreplace "qtads.pro",
	 "INCLUDEPATH += src $$T2DIR $$T3DIR $$HTDIR",
	 "INCLUDEPATH += src $$T2DIR $$T3DIR $$HTDIR #{sdl_sound_include}/SDL"
	 system "qmake", "DEFINES+=NO_STATIC_TEXTCODEC_PLUGINS"
	 system "make"
	 prefix.install "QTads.app"
	 bin.write_exec_script "#{prefix}/QTads.app/Contents/MacOS/QTads"
	 man6.install "share/man/man6/qtads.6"
