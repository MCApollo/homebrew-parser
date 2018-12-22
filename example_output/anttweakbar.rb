name :
	 Anttweakbar
homepage :
	 https://anttweakbar.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/anttweakbar/AntTweakBar_116.zip
description :
	 C/C++ library for adding GUIs to OpenGL apps
build_deps :
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/62e79481/anttweakbar/anttweakbar.diff
EOF_patch :
install :
	 if DevelopmentTools.clang_build_version >= 900 ||
	 (MacOS.version == :el_capitan && MacOS::Xcode.installed? &&
	 MacOS::Xcode.version >= "8.0")
	 ENV.delete("SDKROOT")
	 end
	 system "make", "-C", "src", "-f", "Makefile.osx"
	 lib.install "lib/libAntTweakBar.dylib", "lib/libAntTweakBar.a"
	 include.install "include/AntTweakBar.h"
