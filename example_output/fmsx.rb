name :
	 Fmsx
homepage :
	 https://fms.komkon.org/fMSX/
url :
	 https://fms.komkon.org/fMSX/fMSX54.zip
description :
	 MSX emulator
build_deps :
link_deps :
	 pulseaudio
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 chdir "fMSX/Unix" do
	 inreplace "Makefile" do |s|
	 pa = Formula["pulseaudio"]
	 s.gsub! %r{(DEFINES\s*\+=\s*[-\/$()\w\t ]*)}, "\\1 -DPULSE_AUDIO"
	 s.gsub! %r{(CFLAGS\s*\+=\s*[-\/$()\w\t ]*)}, "\\1 -I#{pa.include}\nLIBS += -L#{pa.lib} -lpulse-simple"
