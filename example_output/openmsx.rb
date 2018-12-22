name :
	 Openmsx
homepage :
	 https://openmsx.org/
url :
	 https://github.com/openMSX/openMSX/releases/download/RELEASE_0_15_0/openmsx-0.15.0.tar.gz
description :
	 MSX emulator
build_deps :
link_deps :
	 freetype
	 glew
	 libpng
	 sdl
	 sdl_ttf
conflicts :
patches :
EOF_patch :
install :
	 ENV.O0
	 inreplace "build/custom.mk", "/opt/openMSX", prefix
	 inreplace "build/libraries.py" do |s|
	 s.gsub! /\((distroRoot), \)/, "(\\1, '/usr', '#{MacOS.sdk_path}/System/Library/Frameworks/Tcl.framework')"
	 s.gsub! "lib/tcl", "."
	 end
	 system "./configure"
	 system "make"
	 prefix.install Dir["derived/**/openMSX.app"]
	 bin.write_exec_script "#{prefix}/openMSX.app/Contents/MacOS/openmsx"
