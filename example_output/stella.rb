name :
	 Stella
homepage :
	 https://stella-emu.github.io/
url :
	 https://github.com/stella-emu/stella/releases/download/5.1.3/stella-5.1.3-src.tar.xz
description :
	 Atari 2600 VCS emulator
build_deps :
	 :xcode
link_deps :
	 libpng
	 sdl2
conflicts :
patches :
EOF_patch :
install :
	 sdl2 = Formula["sdl2"]
	 libpng = Formula["libpng"]
	 cd "src/macosx" do
	 inreplace "stella.xcodeproj/project.pbxproj" do |s|
	 s.gsub! %r{(\w{24} \/\* SDL2\.framework)}, '//\1'
	 s.gsub! %r{(\w{24} \/\* png)}, '//\1'
	 s.gsub! /(HEADER_SEARCH_PATHS) = \(/,
	 "\\1 = (#{sdl2.opt_include}/SDL2, #{libpng.opt_include},"
	 s.gsub! /(LIBRARY_SEARCH_PATHS) = ("\$\(LIBRARY_SEARCH_PATHS\)");/,
	 "\\1 = (#{sdl2.opt_lib}, #{libpng.opt_lib}, \\2);"
	 s.gsub! /(OTHER_LDFLAGS) = "((-\w+)*)"/, '\1 = "-lSDL2 -lpng \2"'
