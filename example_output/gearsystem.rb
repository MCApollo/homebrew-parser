name :
	 Gearsystem
homepage :
	 https://github.com/drhelius/Gearsystem
url :
	 https://github.com/drhelius/Gearsystem/archive/gearsystem-2.2.tar.gz
description :
	 Sega Master System / Game Gear emulator
build_deps :
link_deps :
	 qt
	 sdl2
conflicts :
patches :
EOF_patch :
install :
	 cd "platforms/macosx/Gearsystem" do
	 inreplace "Gearsystem.pro" do |s|
	 s.gsub! "/usr/local/include", Formula["sdl2"].include.to_s
	 s.gsub! "/usr/local/lib", Formula["sdl2"].lib.to_s
	 end
	 system "#{Formula["qt"].bin}/qmake", "PREFIX=#{prefix}", "CONFIG+=c++11"
	 system "make"
	 prefix.install "Gearsystem.app"
	 bin.write_exec_script "#{prefix}/Gearsystem.app/Contents/MacOS/Gearsystem"
	 end
