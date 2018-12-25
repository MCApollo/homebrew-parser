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
optional_deps :
conflicts :
resource :
	 ['msx-rom', 'msx2-rom', 'msx2ext-rom', 'msx2p-rom', 'msx2pext-rom', 'fmpac-rom', 'disk-rom', 'msxdos2-rom', 'painter-rom', 'kanji-rom']
	 ['https://fms.komkon.org/fMSX/src/MSX.ROM', 'https://fms.komkon.org/fMSX/src/MSX2.ROM', 'https://fms.komkon.org/fMSX/src/MSX2EXT.ROM', 'https://fms.komkon.org/fMSX/src/MSX2P.ROM', 'https://fms.komkon.org/fMSX/src/MSX2PEXT.ROM', 'https://fms.komkon.org/fMSX/src/FMPAC.ROM', 'https://fms.komkon.org/fMSX/src/DISK.ROM', 'https://fms.komkon.org/fMSX/src/MSXDOS2.ROM', 'https://fms.komkon.org/fMSX/src/PAINTER.ROM', 'https://fms.komkon.org/fMSX/src/KANJI.ROM']
patches :
EOF_patch :
install :
	 chdir "fMSX/Unix" do
	 inreplace "Makefile" do |s|
	 pa = Formula["pulseaudio"]
	 s.gsub! %r{(DEFINES\s*\+=\s*[-\/$()\w\t ]*)}, "\\1 -DPULSE_AUDIO"
	 s.gsub! %r{(CFLAGS\s*\+=\s*[-\/$()\w\t ]*)}, "\\1 -I#{pa.include}\nLIBS += -L#{pa.lib} -lpulse-simple"
	 end
	 system "make"
	 bin.install "fmsx"
	 end
	 pkgshare.install "fMSX/Unix/CARTS.SHA"
	 resources.each { |r| pkgshare.install r }
