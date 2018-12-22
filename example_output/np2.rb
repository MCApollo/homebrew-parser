name :
	 Np2
homepage :
	 https://www.yui.ne.jp/np2/
url :
	 2606
description :
	 Neko Project 2: PC-9801 emulator
build_deps :
	 :xcode
link_deps :
	 sdl2
	 sdl2_ttf
conflicts :
patches :
EOF_patch :
install :
	 sdl2 = Formula["sdl2"]
	 sdl2_ttf = Formula["sdl2_ttf"]
	 cd "sdl2/MacOSX" do
	 inreplace "np2sdl2.xcodeproj/project.pbxproj" do |s|
	 s.gsub! "BAF84E4B195AA35E00183062", "//BAF84E4B195AA35E00183062"
	 s.gsub! "HEADER_SEARCH_PATHS = (",
	 "LIBRARY_SEARCH_PATHS = (\"$(inherited)\", #{sdl2.lib}, #{sdl2_ttf.lib}); " \
	 "HEADER_SEARCH_PATHS = (#{sdl2.include}/SDL2, #{sdl2.include}, #{sdl2_ttf.include},"
	 s.gsub! "buildSettings = {", 'buildSettings ={ OTHER_LDFLAGS = "-lSDL2 -lSDL2_ttf";'
	 end
	 inreplace "np2sdl2/compiler.h", "#define RESOURCE_US", ""
	 inreplace "np2sdl2/main.m", "[pstrBundlePath UTF8String]", '"./"'
	 xcodebuild "SYMROOT=build"
	 bin.install "build/Release/np2sdl2.app/Contents/MacOS/np2sdl2" => "np2"
	 end
