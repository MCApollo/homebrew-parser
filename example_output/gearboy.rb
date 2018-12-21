name :
	 Gearboy
homepage :
	 https://github.com/drhelius/Gearboy
url :
	 https://github.com/drhelius/Gearboy/archive/gearboy-2.3.1.tar.gz
description :
	 Nintendo Game Boy (Color) emulator
build_deps :
link_deps :
	 qt
	 sdl2
conflicts :
patches :
EOF_patch :
install :
	 cd "platforms/macosx/Gearboy" do
	 inreplace "Gearboy.pro" do |s|
	 s.gsub! "/usr/local/include", Formula["sdl2"].include
	 s.gsub! "/usr/local/lib", Formula["sdl2"].lib
