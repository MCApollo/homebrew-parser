name :
	 Supermodel
homepage :
	 https://www.supermodel3.com/
url :
	 https://www.supermodel3.com/Files/Supermodel_0.2a_Src.zip
description :
	 Sega Model 3 arcade emulator
build_deps :
link_deps :
	 sdl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "Makefiles/Makefile.SDL.OSX.GCC" do |s|
	 s.gsub! "-framework SDL", "`sdl-config --libs`"
	 s.gsub! /(\$\(COMPILER_FLAGS\))/, "\\1 -I#{Formula["sdl"].opt_prefix}/include"
	 s.gsub! %r{(\$\(OBJ_DIR\)/m68k\w+)\.o: \1.c (.*)\n(\s*\$\(CC\)) \$<}, "\\1.o: \\2\n\\3 \\1.c"
	 end
	 inreplace "Src/OSD/SDL/Main.cpp" do |s|
	 s.gsub! %r{(Config|Saves|NVRAM)/}, "#{var}/supermodel/\\1/"
	 s.gsub! /(\w+\.log)/, "#{var}/supermodel/Logs/\\1"
	 end
	 system "make", "-f", "Makefiles/Makefile.SDL.OSX.GCC"
	 bin.install "bin/Supermodel" => "supermodel"
	 (var/"supermodel/Config").install "Config/Supermodel.ini"
	 (var/"supermodel/Saves").mkpath
	 (var/"supermodel/NVRAM").mkpath
	 (var/"supermodel/Logs").mkpath
