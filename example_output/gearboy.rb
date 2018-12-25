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
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cd "platforms/macosx/Gearboy" do
	 inreplace "Gearboy.pro" do |s|
	 s.gsub! "/usr/local/include", Formula["sdl2"].include
	 s.gsub! "/usr/local/lib", Formula["sdl2"].lib
	 end
	 system "#{Formula["qt"].bin}/qmake", "PREFIX=#{prefix}", "CONFIG+=c++11"
	 system "make"
	 prefix.install "Gearboy.app"
	 bin.write_exec_script "#{prefix}/Gearboy.app/Contents/MacOS/Gearboy"
	 end
